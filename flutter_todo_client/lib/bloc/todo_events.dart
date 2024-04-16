import 'package:flutter_todo_client/data/todo_model.dart';

abstract class TodoEvent {}

class GetAllTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;
  AddTodoEvent({required this.todo});
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;
  UpdateTodoEvent({required this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  final String todoId;
  DeleteTodoEvent({required this.todoId});
}
