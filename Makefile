testbuild: logproto/logproto.pb.go
	go build examples/client-example/main.go 

logproto/logproto.pb.go: logproto/logproto.proto
	# brew install protobuf
	# go get -u google.golang.org/grpc
	# go get -u github.com/golang/protobuf/protoc-gen-go
	# go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc
	go mod vendor
	# PATH=$$PATH:$$GOPATH/bin (if needed)
	protoc \
		-I ./vendor -I ./ \
		--go_out=. \
		--go_opt=paths=source_relative \
		--go-grpc_out=. \
		--go-grpc_opt=paths=source_relative \
		$^
