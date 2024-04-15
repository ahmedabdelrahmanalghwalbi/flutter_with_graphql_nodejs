import {ToDo} from './db_schema.js';
export const resolvers = {
    Query: {
        todos: async ()=>{
            try {
                return await ToDo.find();
            } catch (error) {
                console.log(error);
            }
        }
    },
    Mutation: {
        addTodo: async (_, args) => {
            try {                
                const todo = new ToDo(args);
                await todo.save();
                return todo;                
            } catch (error) {
                console.log(error);
            }

        },
        deleteTodo: async (_, args) => {
            try {
                return await ToDo.findOneAndDelete(args.id);
            } catch (error) {
                console.log(error);
            }
        },
        updateTodo: async (_, args) => {
            try {
                const todo = await ToDo.findByIdAndUpdate(args.id, args, {new: true});
                return todo;
            } catch (error) {
                console.log(error);
            }
        }
    },
    ToDo: {
        completed: (todo) => todo.completed
    }
};