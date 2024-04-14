import { ApolloServer } from "@apollo/server";
import express from "express";
import { expressMiddleware } from "@apollo/server/express4";
import { ApolloServerPluginDrainHttpServer } from "@apollo/server/plugin/drainHttpServer";
import {dbConnect} from './db_connect.js';
import {typeDefs} from './schema.js';
import {resolves} from './resolvers.js';
import cors from './cors';
import bodyParser from "body-parser";

// connect to Database
dbConnect();
const app = express();
//connect to Apollo Server
const server = new ApolloServer({
    typeDefs,
    resolvers: resolves,
    plugins: [
        ApolloServerPluginDrainHttpServer({
            httpServer: app
        })
    ]
});

// start Apollo Server
await server.start();

app.use(
    '/graphql',
    cors(),
    bodyParser.urlencoded({ extended: true }),
    bodyParser.json(),
    expressMiddleware(server));

app.listen(4000, () => {
    console.log("Server is running on port 4000  -- GRAPG QL -- !");
});