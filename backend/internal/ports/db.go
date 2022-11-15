package port

import "go.mongodb.org/mongo-driver/mongo"

type DB interface {
	// Add(arg interface{}, collection *mongo.Collection) error
	// FindAll(dest interface{}, conditions map[string]interface{}, collection *mongo.Collection) error
	DeleteOne(model interface{}, conditions map[string]interface{}, collection *mongo.Collection) error
	Update(model interface{}, conditions map[string]interface{}, updates interface{}, collection *mongo.Collection) error
	// FindOne(dest interface{}, conditions map[string]interface{}, collection *mongo.Collection) error
	// FindById(dest interface{}, conditions map[string]interface{}, collection *mongo.Collection) error
}
