# Notes

The examples below are for Windows, but corresponding steps also apply for other operating systems.

## Environment

1. Install Go.
2. Make sure PATH contains `C:\Go\bin`, assuming thats where Go was installed.
3. Add a new environment variable called `GOROOT` with value `C:\Go`.
4. Be sure to set `GOPATH` (user) environment variable variable (`G:\dev\go` as an example on Windows).
5. GO projects will need to be under `G:\dev\go`, using the above example. Possibly under a folder called `_my-projects`, or some name of your choosing. Alternately, a different folder can also be used for personal Go projects.
6. Add `G:\dev\go\bin` (using above example) to PATH.

## Getting imported packages

For all non-native Go packages you have to do a `go get -u`. Check your source files for those imported packages. For example, in api/handler.go, we have imported `golang.org/x/net/context`, so we have to run `go get -u golang.org/x/net/context`.

## Steps to get protobuf compilation working

1. Get protocol buffers from: https://github.com/google/protobuf/releases.
2. Add location of local `bin` folder under protobuf to PATH.
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
