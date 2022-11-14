package server

import (
	"context"
	"fmt"
	"net/http"
	"quiz-app/internal/middleware"
	"quiz-app/internal/models"
	db "quiz-app/internal/mongoDB"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

func CreateQuestion(ctx *gin.Context) {
	question := models.Question{}

	err := ctx.BindJSON(&question)

	if err != nil {
		fmt.Println("error binding question: ", err)

		ctx.IndentedJSON(http.StatusExpectationFailed, err.Error())
		return
	}

	if question.Number == 0 || question.Message == "" || question.Answers == nil {

		ctx.IndentedJSON(http.StatusExpectationFailed, ("question number, message and answers are required but empty"))
		return
	}
	// check existing
	_, QuestionExists := middleware.QuestionExists(question.Number)
	fmt.Println("QuestionExists:: ", QuestionExists)

	if QuestionExists {
		ctx.IndentedJSON(http.StatusExpectationFailed, (" This question number already exists,"))
		return
	}

	// question.ID = time.Now().Format("2006-01-02 15:04:05")
	_, err = db.QuestionCollection.InsertOne(db.MongoCtx, question)

	if err != nil {
		fmt.Println("error inserting question: ", err)
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}

	ctx.IndentedJSON(http.StatusCreated, "Question added successfully.")
}

func ListQuestions(ctx *gin.Context) {
	questionList := []*models.Question{}

	cur, err := db.QuestionCollection.Find(context.TODO(), bson.M{})
	if err != nil {
		fmt.Println("error listing questions", err)
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}
	if err = cur.All(context.TODO(), &questionList); err != nil {
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}
	ctx.IndentedJSON(http.StatusAccepted, questionList)
}

func EnableQuestion(ctx *gin.Context) {

	questionID := ctx.Param("questionID")

	req, _ := primitive.ObjectIDFromHex(questionID)
	filter := bson.M{"_id": req}

	foundQuestion, IsQuestionFound := middleware.IsQuestionFound(questionID)
	if !IsQuestionFound {
		ctx.IndentedJSON(http.StatusExpectationFailed, "question with this ID not found")
		return
	}

	// check existing
	foundQuestion.Enabled = true
	data := &models.Question{
		Message: foundQuestion.Message,
		Answers: foundQuestion.Answers,
		Number:  foundQuestion.Number,
		Enabled: true,
	}
	_, err := db.QuestionCollection.UpdateOne(db.MongoCtx, filter, bson.M{"$set": data})

	if err != nil {
		fmt.Println("error enabling question: ", err)
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}

	ctx.IndentedJSON(http.StatusAccepted, foundQuestion)
}

func GetEnabledQuestion(ctx *gin.Context) {
	question := &models.Question{}

	filter := bson.M{"enabled": true}
	// check existing
	err := db.QuestionCollection.FindOne(db.MongoCtx, filter).Decode(question)
	if err != nil {
		fmt.Println("error finding enabled question: ", err)
		ctx.IndentedJSON(http.StatusInternalServerError, err.Error())
		return
	}

	ctx.IndentedJSON(http.StatusAccepted, question)
}
