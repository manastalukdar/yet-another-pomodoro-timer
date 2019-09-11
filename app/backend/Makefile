SERVER_OUT := "../../bin/app/backend/server"
CLIENT_OUT := "../../bin/app/backend/client"
API_OUT := "api/api.pb.go"
API_REST_OUT := "api/api.pb.gw.go"
PKG := "github.com/manastalukdar/yet-another-pomodoro-timer"
SERVER_PKG_BUILD := "${PKG}/app/backend/server.exe"
CLIENT_PKG_BUILD := "${PKG}/app/backend/client.exe"
PKG_LIST := $(shell go list ${PKG}/... | grep -v /vendor/)

.PHONY: all api server client

all: server client

#protocPreReqs:
#	@go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
#	@go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
#	@go get -u github.com/golang/protobuf/protoc-gen-go

api/api.pb.go: # protocPreReqs
	@protoc -I api/ \
		-I${GOPATH}/src/github.com/manastalukdar/yet-another-pomodoro-timer/app/backend/api/ \
		api.proto \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--go_out=plugins=grpc:api

api/api.pb.gw.go: api/api.pb.go
	@protoc -I api/ \
		-I${GOPATH}/src/github.com/manastalukdar/yet-another-pomodoro-timer/app/backend/api/ \
		api.proto \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--grpc-gateway_out=logtostderr=true:api \

api/api.swagger.json: api/api.proto
	@protoc -I api/ \
		-I${GOPATH}/src/github.com/manastalukdar/yet-another-pomodoro-timer/app/backend/api/ \
		api.proto \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--swagger_out=logtostderr=true:api \

api: api/api.pb.go api/api.pb.gw.go api/api.swagger.json ## Auto-generate grpc go sources

dep: ## Get the dependencies
	@go get -v -d ./...

server: dep api ## Build the binary file for server
	@go build -i -v -o $(SERVER_OUT) $(SERVER_PKG_BUILD)

client: dep api ## Build the binary file for client
	@go build -i -v -o $(CLIENT_OUT) $(CLIENT_PKG_BUILD)

clean: ## Remove previous builds
	@rm $(SERVER_OUT) $(CLIENT_OUT) $(API_OUT) $(API_REST_OUT) $(API_SWAG_OUT)

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'




