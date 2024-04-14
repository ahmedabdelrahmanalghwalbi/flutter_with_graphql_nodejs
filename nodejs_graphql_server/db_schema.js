import { Schema,model } from "mongoose";

const toDoSchema = new Schema({
    id:{
        unique:true,
        type: String,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    content: {
        type: String,
        required: true
    },
    date: {
        type: Date,
        default: Date.now
    },
    completed: {
        type: Boolean,
        default: false
    }
});

export const ToDo = model("ToDo", toDoSchema);