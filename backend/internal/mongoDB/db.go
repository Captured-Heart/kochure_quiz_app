package mongoDB

import (
	"context"
	"fmt"
	"log"
	"os"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

var (
	DB                 *mongo.Client
	QuestionCollection *mongo.Collection
	UsersCollection    *mongo.Collection
	ResultCollection   *mongo.Collection
	MongoCtx           context.Context
)

func Init() {

	// configs := config.ReadConfigs(".")
	// Create a new client and connect to the server
	// collectionName := configs.DbTable
	// collectionName := os.Getenv("TABLE_NAME")

	fmt.Println("Connecting to MongoDB...")
	mongoURI := os.Getenv("MONGO_URI")
	dbName := os.Getenv("DB_NAME")
	MongoCtx = context.Background()

	DB, err := mongo.Connect(MongoCtx, options.Client().ApplyURI(mongoURI))
	// client, err := mongo.Connect(context.TODO(), options.Client().ApplyURI(uri))

	if err != nil {
		log.Fatal(err)
	}

	// checking whether the connection was successful by pinging the mongoDB server
	err = DB.Ping(MongoCtx, nil)

	if err != nil {
		log.Fatalf("Could not connect to MongoDB: %v\n", err)
	} else {
		fmt.Println("Connected to MongoDB")
	}

	// bind out collection to our global variable for use in other methods
	// menudb = (*mongo.Collection)(db.Database("menuDB").Collection("menu"))

	QuestionCollection = DB.Database(dbName).Collection(os.Getenv("QUESTIONS_COLLECTION"))
	UsersCollection = DB.Database(dbName).Collection(os.Getenv("USERS_COLLECTION"))
	ResultCollection = DB.Database(dbName).Collection(os.Getenv("RESULTS_COLLECTION"))
}

func DeleteOne(arg interface{}, conditions map[string]interface{}, collection *mongo.Collection) error {
	_, err := collection.DeleteOne(MongoCtx, conditions)
	if err != nil {
		return err
	}
	return nil
}

func Update(arg interface{}, conditions map[string]interface{}, update interface{}, collection *mongo.Collection) error {
	_, err := collection.UpdateOne(MongoCtx, conditions, bson.M{"$set": update})
	if err != nil {
		return err
	}
	return nil
}
