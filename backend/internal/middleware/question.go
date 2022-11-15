package middleware

import (
	"quiz-app/internal/models"
	db "quiz-app/internal/mongoDB"
	"strings"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

func IsQuestionFound(req string) (*models.Question, bool) {
	var question *models.Question
	requestItem := strings.TrimSpace(req)

	questionID, _ := primitive.ObjectIDFromHex(requestItem)
	filter := bson.M{"_id": questionID}
	err := db.QuestionCollection.FindOne(db.MongoCtx, filter).Decode(&question)
	if err != nil {
		return nil, false
	}
	return question, true
}

func QuestionExists(number int64) (*models.Question, bool) {

	var question *models.Question
	filter := bson.M{"number": number}
	err := db.QuestionCollection.FindOne(db.MongoCtx, filter).Decode(&question)
	if err != nil {
		return nil, false
	}
	return question, true
}

func IsUserFound(req string) (*models.User, bool) {
	var User *models.User
	requestItem := strings.TrimSpace(req)

	UserID, _ := primitive.ObjectIDFromHex(requestItem)
	filter := bson.M{"_id": UserID}
	err := db.UsersCollection.FindOne(db.MongoCtx, filter).Decode(&User)
	if err != nil {
		return nil, false
	}
	return User, true
}

func UserExists(email, name, phone string) (*models.User, bool) {

	var User *models.User
	filter := bson.M{"email": email, "phone": phone, "name": name}
	err := db.UsersCollection.FindOne(db.MongoCtx, filter).Decode(&User)
	if err != nil {
		return nil, false
	}
	return User, true
}

func UserIDExists(userID string) (*models.User, bool) {

	var User *models.User

	req, _ := primitive.ObjectIDFromHex(userID)
	filter := bson.M{"_id": req}

	err := db.UsersCollection.FindOne(db.MongoCtx, filter).Decode(&User)
	if err != nil {
		return nil, false
	}
	return User, true
}
