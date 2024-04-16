import 'package:flutter_todo_client/data/todo_model.dart';

abstract class TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;
  TodoLoadedState({required this.todos});
}

class TodoMutatedState extends TodoState {
  final bool mutated;
  TodoMutatedState({required this.mutated});
}

class TodoErrorState extends TodoState {
  final String message;
  TodoErrorState({required this.message});
}
