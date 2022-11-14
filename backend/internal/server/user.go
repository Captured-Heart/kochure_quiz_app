package server

import (
	"context"
	"fmt"
	"net/http"
	"quiz-app/internal/middleware"
	"quiz-app/internal/models"
	db "quiz-app/internal/mongoDB"
	"strings"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

func CreateAccount(ctx *gin.Context) {

	user := models.User{}

	err := ctx.BindJSON(&user)
	if err != nil {
		fmt.Println("error binding user: ", err)
		ctx.IndentedJSON(http.StatusExpectationFailed, err.Error())
		return
	}

	if user.Email == "" || user.Name == "" || user.Phone == "" {

		ctx.IndentedJSON(http.StatusExpectationFailed, ("question Email, Name and Phone are required but empty"))
		return
	}
	validEmail := strings.TrimSpace(strings.ToLower(user.Email))
	validName := strings.TrimSpace(strings.ToLower(user.Name))
	validPhone := strings.TrimSpace(strings.ToLower(user.Phone))
	_, userExists := middleware.UserExists(validEmail, validName, validPhone)
	// check existing

	if userExists {
		ctx.IndentedJSON(http.StatusExpectationFailed, (" A user with this email, phone and name already exists."))
		return
	}
	user.Email = validEmail
	user.Phone = validPhone
	user.Name = validName

	result, err := db.UsersCollection.InsertOne(db.MongoCtx, user)
	if err != nil {
		ctx.IndentedJSON(http.StatusExpectationFailed, err.Error())
		return
	}
	data := &models.UserAnswer{}

	// result.InsertedID
	if oid, ok := result.InsertedID.(primitive.ObjectID); ok {
		data.UserID = oid.Hex()
		user.Clearance = oid.Hex()

		// user.ID, _:= primitive.ObjectIDFromHex(oid.Hex())

	}
	go func() {
		_, err = db.ResultCollection.InsertOne(db.MongoCtx, data)
		if err != nil {
			fmt.Println("error starting user result sheet")
			ctx.IndentedJSON(http.StatusExpectationFailed, err.Error())
			return
		}
	}()
	ctx.IndentedJSON(http.StatusCreated, user.Clearance)
	return
}

func ListUsers(ctx *gin.Context) {
	userList := []*models.User{}

	cur, err := db.UsersCollection.Find(context.TODO(), bson.M{})
	if err != nil {
		fmt.Println("error listing users", err)
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}
	if err = cur.All(context.TODO(), &userList); err != nil {
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}
	ctx.IndentedJSON(http.StatusOK, userList)
}

func DeleteUser(ctx *gin.Context) {
	userId := ctx.Param("userID")
	user := &models.User{}
	req, _ := primitive.ObjectIDFromHex(userId)
	filter := bson.M{"_id": req}

	_, userIDExists := middleware.UserIDExists(userId)

	if !userIDExists {
		ctx.IndentedJSON(http.StatusExpectationFailed, "user with this ID not found")
		return
	}

	err := db.DeleteOne(user, filter, db.UsersCollection)
	if err != nil {
		fmt.Println("error deleting user: ", err)
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}

	ctx.IndentedJSON(http.StatusAccepted, ("user deleted succesfully"))
}
