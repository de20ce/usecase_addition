ARTIFACTS=

ARTIFACTS += src/generated/golang/addition_grpc.pb.go
ARTIFACTS += src/generated/golang/addition.pb.go

ARTIFACTS += src/generated/python/addition_pb2_grpc.python
ARTIFACTS += src/generated/python/addition_pb2.python

ARTIFACTS += src/generated/dart/usecase/lib/src/addition.pb.dart
ARTIFACTS += src/generated/dart/usecase/lib/src/addition.pbenum.dart
ARTIFACTS += src/generated/dart/usecase/lib/src/addition.pbgrpc.dart
ARTIFACTS += src/generated/dart/usecase/lib/src/addition.pbjson.dart

createdartlib:
	dart create --template=package --force usecase

runpythonserver:
	python3 src/generated/python/async_addition_server.py

runpythonclient:
	python3 src/generated/python/async_addition_client.py
	
runngrok:
	ngrok tcp 127.0.0.1:50051ss

goproto:
# We omit --go_opt=paths=source_relative and --go-grpc_opt=paths=source_relative
# flag because we do not to create "protos" directory inside src/generated/golang 
	protoc --go_out=src/generated/golang  \
    	--go-grpc_out=src/generated/golang  \
   	 	protos/*.proto

pyproto:
	python3 -m grpc_tools.protoc -I./protos \
  		--python_out=./src/generated/python --grpc_python_out=./src/generated/python \
  		./protos/*.proto

dartproto:
# -Iprotos flag allow to define the proto directory. For Dart, this
# directory seems to start with the name "protos" in its root directory
	protoc --dart_out=grpc:src/generated/dart/usecase/lib/src -Iprotos ./protos/addition.proto

all: createdartlib dartproto goproto pyproto

.PHONY: all

clean:
	rm -f ${ARTIFACTS}
