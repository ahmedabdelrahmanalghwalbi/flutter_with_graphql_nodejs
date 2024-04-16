
---

# Todo App with GraphQL Integration

## Overview

This is a full-stack Todo application built with Node.js, GraphQL, and Flutter. The backend is powered by Apollo Server, which provides a GraphQL API to manage Todos stored in a MongoDB database. The frontend is developed using Flutter, providing cross-platform mobile applications for Android and iOS.

## Features

- Create, read, update, and delete Todos.
- Real-time updates with GraphQL subscriptions.
- State management in the Flutter app using Bloc.
- Cross-platform mobile applications for Android and iOS.

## Technologies Used

### Backend

- [Apollo Server](https://www.apollographql.com/docs/apollo-server/): GraphQL server library for Node.js.
- [Express](https://expressjs.com/): Web framework for Node.js.
- [GraphQL](https://graphql.org/): Query language for APIs.
- [MongoDB](https://www.mongodb.com/): NoSQL database for storing Todos.
- [Mongoose](https://mongoosejs.com/): MongoDB object modeling tool.
- [Nodemon](https://nodemon.io/): Utility for automatically restarting the server during development.
- [Cors](https://github.com/expressjs/cors): Middleware for enabling CORS in the server.
- [Body-parser](https://www.npmjs.com/package/body-parser): Middleware for parsing request bodies.



![Screenshot 2024-04-16 162310](https://github.com/ahmedabdelrahmanalghwalbi/flutter_with_graphql_nodejs/assets/64208176/0392e673-b14b-483b-a594-ec5de46b2d48)



### Frontend

- [Flutter](https://flutter.dev/): UI toolkit for building natively compiled applications for mobile, web, and desktop.
- [Bloc](https://bloclibrary.dev/): State management library for Flutter.
- [http](https://pub.dev/packages/http): Flutter package for making HTTP requests.
- [graphql_flutter](https://pub.dev/packages/graphql_flutter): Flutter package for GraphQL integration.

## GraphQL

GraphQL is a query language for APIs that allows clients to request only the data they need. Here are some key points about GraphQL:

- **Declarative Data Fetching**: Clients can specify exactly what data they need, minimizing over-fetching and under-fetching.
- **Single Endpoint**: GraphQL APIs typically have a single endpoint for all queries, mutations, and subscriptions.
- **Strongly Typed**: GraphQL schemas define the structure of the data and allow for strong type checking.
- **Real-time Updates**: Subscriptions enable real-time updates from the server to clients.

## Differences Between GraphQL and REST API

GraphQL and REST API are both used to build APIs but have some fundamental differences:

- **Endpoint Structure**: REST APIs have multiple endpoints for different resources, while GraphQL has a single endpoint.
- **Data Fetching**: With REST, clients often receive more data than they need (over-fetching). GraphQL allows clients to request only the data they need.
- **Response Format**: REST APIs typically return fixed data structures defined by the server. GraphQL responses match the structure of the query.
- **Evolution**: REST APIs can require versioning to introduce changes. GraphQL APIs can evolve over time without breaking changes.

## Queries and Mutations

### Queries

- **Get All Todos**:
  ```graphql
  query {
    todos {
      id
      title
      content
      completed
    }
  }
  ```

- **Get Todo by ID**:
  ```graphql
  query GetTodo($id: ID!) {
    todo(id: $id) {
      id
      title
      content
      completed
    }
  }
  ```

### Mutations

- **Create Todo**:
  ```graphql
  mutation CreateTodo($input: CreateTodoInput!) {
    createTodo(input: $input) {
      id
      title
      content
      completed
    }
  }
  ```

- **Update Todo**:
  ```graphql
  mutation UpdateTodo($id: ID!, $input: UpdateTodoInput!) {
    updateTodo(id: $id, input: $input) {
      id
      title
      content
      completed
    }
  }
  ```

- **Delete Todo**:
  ```graphql
  mutation DeleteTodo($id: ID!) {
    deleteTodo(id: $id) {
      id
    }
  }
  ```

## Getting Started

To run the Todo app locally, follow these steps:

1. **Backend Setup**:
   - Install Node.js and MongoDB if not already installed.
   - Clone the repository and navigate to the backend directory.
   - Install dependencies: `npm install`.
   - Start the server: `npm start`.

2. **Frontend Setup**:
   - Install Flutter SDK if not already installed.
   - Clone the repository and navigate to the frontend directory.
   - Install dependencies: `flutter pub get`.
   - Run the app: `flutter run`.

