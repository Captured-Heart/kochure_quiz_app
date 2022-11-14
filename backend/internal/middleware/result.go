package middleware

import (
	"fmt"
	"quiz-app/internal/models"
	db "quiz-app/internal/mongoDB"

	"go.mongodb.org/mongo-driver/bson"
)

func ResultExists(userID string) (*models.UserAnswer, bool) {

	var answer *models.UserAnswer
	filter := bson.M{"userID": userID}
	fmt.Println(filter, " :filter")

	err := db.ResultCollection.FindOne(db.MongoCtx, filter).Decode(&answer)
	if err != nil {
		return nil, false
	}
	fmt.Println("userID: ", answer)
	return answer, true

}
