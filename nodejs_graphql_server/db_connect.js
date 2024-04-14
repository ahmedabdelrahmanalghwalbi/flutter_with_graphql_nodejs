import {mongoose} from "mongoose";

const db = "mongodb://localhost:27017";


export const dbConnect = async()=>{
    try{
        await mongoose.connect(db, {useNewUrlParser: true, useUnifiedTopology: true});
        console.log("Connected to MongoDB !!!!!!!");
    }catch(err){
        console.log(err);
    }
}