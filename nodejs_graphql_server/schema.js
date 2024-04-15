export const typeDefs = `#graphql

    type ToDo{
        id: String!,
        title: String!,
        completed: Boolean!,
    }

    type Query{
        todos: [ToDo]
    }

    type Mutation{
        addTodo(id:String!, title: String!, content: String!): ToDo,
        deleteTodo(id:String!): ToDo,
        updateTodo(id:String!, title: String!, content: String!): ToDo
    }

`;