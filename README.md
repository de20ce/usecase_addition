
[![Python 3.10](https://img.shields.io/badge/python-3.2.3-blue.svg)](https://www.python.org/downloads/release/python-310/)
[![Dart 3.2.3](https://img.shields.io/badge/dart-3.2.4-darkblue.svg)](hhttps://dart.dev/get-dart#release-channels)
[![grpc protoc 3.12.4](https://img.shields.io/badge/grpc-3.12.4-darkgreen.svg)](https://grpc.io)


Simple Addition gRPC Server
--------------------------- 

# Project Description

The project aims at showing a server side implementation of a simple 
integer addition `gRPC` example operation in Python. The Flutter client is in another repo.

Here, the server implements two types of operations among the 4 usual gRPC operators:

    - Simple Unary Integer Addition
    - Client Streaming/ Server Streaming Integer Addition

## Project pre-requisite
    - On the server side, Python basic dev tools should be installed on your OS, as well as [Python gRPC](https://grpc.io/docs/languages/python/quickstart/) dev tools. 

    - On the client side, basic Dart tools and corresponding gRPC dev tools should also be installed. Since, Flutter is also used for client application. There is a basic `Python` client in thais repo as well.
    
    - ngrok: you should use [ngrok](https://ngrok.com/docs/guides/device-gateway/linux/) to manage server and client exchange 
    through channel: Flutter uses socket internally to manage connection.
    This is the simple way we have found  to establish connection betwenn the
    server and the client. Please, follow only step 1 in the `ngrok` link above: 
    the other steps are not mandatory for this project.

# Running instructions

Open two terminals and run the following command inside the root of the project
```bash

    make  runpythonserver
```

In the other terminal, run the following:
```bash
    make runngrok
```
And that's it on the server side!

For python client:
```bash
    make runpythonclient
```

# Disclaimers
This project goal is to demonstrate a very simple example about interfacing two or more
programming language on a client/server api architecture: this is mostly about a proof of concept (or a very basic prototype) than anything else. 

