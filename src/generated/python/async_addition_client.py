import asyncio
import logging
from typing import Iterable

import grpc
import addition_pb2
import addition_pb2_grpc

def makeAddition (
        a: int, b: int
        ) -> addition_pb2.AdditionRequest:
    return addition_pb2.AdditionRequest(
        a=a,
        b=b
    )

async def addition_get_one_result(
        stub: addition_pb2_grpc.AdditionStub, args: addition_pb2.AdditionRequest
) -> None:
    response = await stub.Add(args)
    if not response.result:
        print("server return incomplete result")

    else:
        print(f'result = {args.result}')

def generate_addition() -> Iterable[addition_pb2.AdditionRequest]:
    additions = [
        makeAddition(10, 20),
        makeAddition(20, 30),
        makeAddition(30, 45),
        makeAddition(30, 100),
        makeAddition(238, 345),
    ]

    for addition in additions:
        print(f"Stream data sending a = {addition.a}, b = {addition.b}")
        yield addition


async def add_chat(stub: addition_pb2_grpc.AdditionStub) -> None:


    # The client generates addition stream and asks for streaming responses
    call = stub.AddChat(generate_addition())
    async for response in call:
        print(f"Stream result received  {response.result}")


async def run() -> None:
    async with grpc.aio.insecure_channel("localhost:50051") as channel:
        stub = addition_pb2_grpc.AdditionStub(channel)
        response = await stub.Add(addition_pb2.AdditionRequest(a=1000, b=15))
        print("Unary result client received: ", response.result)
        responses = await add_chat(stub)
        


if __name__ == "__main__":
    logging.basicConfig()
    asyncio.run(run())