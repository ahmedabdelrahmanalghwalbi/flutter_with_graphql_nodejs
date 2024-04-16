import 'dart:convert';
import 'package:flutter_todo_client/configs/configs.dart';
import 'package:flutter_todo_client/data/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  //get all todos
  Future<List<Todo>?> getAllTodos() async {
    final request = {
      "query": '''
        query {
          todos {
            id
            title
            content
            completed
          }
        }
      '''
    };

    final response = await http.post(Uri.parse(graphqlUrl),
        body: json.encode(request),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return (json.decode(response.body)['data']['todos'] as List)
          .map((e) => Todo.fromJson(e))
          .toList();
    }
    return null;
  }

  //add new todo
  Future<bool> addTodo(Todo todo) async {
    final request = {
      "query": '''
        mutation {
          addTodo(id:"${todo.id}", title: "${todo.title}", content: "${todo.content}", completed: ${todo.completed}) {
            id
            title
            content
            completed
          }
        }
      '''
    };
    final response = await http.post(Uri.parse(graphqlUrl),
        body: json.encode(request),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //delete existing todo
  Future<bool> deleteTodo(String todoId) async {
    final request = {
      "query": '''
        mutation {
          deleteTodo(id:"$todoId") {
            id
            title
            content
            completed
          }
        }
      '''
    };
    final response = await http.post(Uri.parse(graphqlUrl),
        body: json.encode(request),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //update existing todo
  Future<bool> updateTodo(Todo todo) async {
    final request = {
      "query": '''
        mutation {
          updateTodo(id:"${todo.id}", title:"${todo.title}", content:"${todo.content}") {
            id
            title
            content
          }
        }
      '''
    };
    final response = await http.post(Uri.parse(graphqlUrl),
        body: json.encode(request),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
