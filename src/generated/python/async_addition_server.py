import asyncio
import logging
from typing import AsyncIterable 

import grpc
import sys
#sys.path.insert(0, "../generated/python/")

import addition_pb2_grpc

import addition_pb2

"""
    Implementation of Addition Service
    The service is composed of one RPC at the moment
    The RPC takes as input a request and its associated context, 
    and returns a response
"""

class Addition(addition_pb2_grpc.AdditionServicer):
    async def Add(
            self,
            request: addition_pb2.AdditionRequest,
            context: grpc.aio.ServicerContext,
    )-> addition_pb2.AdditionResponse:
        return addition_pb2.AdditionResponse(result=request.a + request.b)
    
    
    async def AddChat(
        self,
        request_iterator: AsyncIterable[addition_pb2.AdditionRequest],
        context: grpc.aio.ServicerContext,
   ) -> AsyncIterable[addition_pb2.AdditionResponse]:
        prev_seq_res = []
        async for new_seq_op in request_iterator:
            yield addition_pb2.AdditionResponse(result=(new_seq_op.a + new_seq_op.b))

            prev_seq_res.append(addition_pb2.AdditionResponse(result=(new_seq_op.a + new_seq_op.b)))

             
        
async def serve() -> None:
    server = grpc.aio.server()
    addition_pb2_grpc.add_AdditionServicer_to_server(Addition(), server)
    listen_addr = "[::]:50051"
    server.add_insecure_port(listen_addr)
    logging.info("starting server on %s", listen_addr)
    await server.start()
    await server.wait_for_termination()

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    #asyncio.get_event_loop().run_until_complete(serve())
    asyncio.run(serve())