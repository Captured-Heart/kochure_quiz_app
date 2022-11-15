package models

import "go.mongodb.org/mongo-driver/bson/primitive"

type Question struct {
	Message string             `json:"message"`
	Number  int64              `json:"number"`
	ID      primitive.ObjectID `bson:"_id,omitempty"`
	Answers []Answer           `json:"answers"`
	Enabled bool               `json:"enabled"`
}

type User struct {
	Name      string             `json:"name"`
	Phone     string             `json:"phone"`
	Email     string             `json:"email"`
	Clearance string             `json:"clearance"`
	ID        primitive.ObjectID `bson:"_id,omitempty"`
}

type Answer struct {
	Value     string `json:"value"`
	IsCorrect bool   `bson:"isCorrect" json:"isCorrect"`
	Points    int64  `json:"points"`
	Option    string `json:"option"`
}
type UserAnswer struct {
	QuestionID    string `bson:"questionID" json:"questionID"`
	UserID        string `bson:"userID" json:"userID"`
	Points        int64  `json:"points"`
	ChoosedOption string `json:"choosedOption" bson:"choosedOption"`
}
