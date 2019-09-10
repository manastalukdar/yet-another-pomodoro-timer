# Notes

## Getting imported packages

For all non-native Go packages you have to do a `go get -u`. Check your source files for those imported packages. For example, in api/handler.go, we have imported `golang.org/x/net/context`, so we have to run `go get -u golang.org/x/net/context`.

## Steps to get protobuf compilation working

1. Get protocol buffers from: https://github.com/google/protobuf/releases.
2. Add location of local bin folder under protobuf to PATH.
3. Run following (for `google/api/annotations.proto`, imported in api/api.proto)

    ```plaintext
    go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
    go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
    go get -u github.com/golang/protobuf/protoc-gen-go
    ```

4. Either of the following commands work, depending on where this project resides

    ```plaintext
    C:\data\devgithub\go\src\github.com\manastalukdar\yet-another-pomodoro-timer>protoc -I %GOPATH%/src/github.com/manastalukdar/yet-another-pomodoro-timer/app/backend/api/ api.proto -I %GOPATH%/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --go_out=plugins=grpc:./app/backend/api 
    ```

    ```plaintext
    C:\data\devgithub\_my-projects\yet-another-pomodoro-timer>protoc -I ./app/backend/api/ api.proto -I %GOPATH%/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --go_out=plugins=grpc:./app/backend/api
    ```
