package main

import (
	"quiz-app/internal/mongoDB"
	"quiz-app/internal/server"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	// loading dot env
	godotenv.Load()
	router := gin.Default()

	// init db
	mongoDB.Init()

	// admin
	router.POST("/questions", server.CreateQuestion)
	router.GET("/questions", server.ListQuestions)
	router.PATCH("/questions/:questionID", server.EnableQuestion)

	// user
	router.PATCH("/questions/enabled/:questionID", server.AnswerQuestion)
	router.GET("/questions/enabled", server.GetEnabledQuestion)
	router.POST("/users", server.CreateAccount)
	router.GET("/users", server.ListUsers)
	router.DELETE("/users/:userID", server.DeleteUser)

	// result
	router.GET("/result", server.ListUsersStanding)

	router.Run("localhost:3400")
}
