import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_client/bloc/todo_events.dart';
import 'package:flutter_todo_client/bloc/todo_states.dart';
import 'package:flutter_todo_client/data/todo_repo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;
  TodoBloc(this.repository) : super(TodoLoadingState()) {
    on<GetAllTodos>((event, emit) async {
      emit(TodoLoadingState());
      await repository.getAllTodos().then((todos) {
        emit(TodoLoadedState(todos: todos ?? []));
      });
    });
    on<AddTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        await repository.addTodo(event.todo);
        emit(TodoMutatedState(mutated: true));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });
    on<UpdateTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      await repository.updateTodo(event.todo).then((todo) {
        emit(TodoMutatedState(mutated: true));
      }).catchError((error) {
        emit(TodoErrorState(message: error));
      });
    });
    on<DeleteTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      await repository.deleteTodo(event.todoId).then((todo) {
        emit(TodoMutatedState(mutated: true));
      }).catchError((error) {
        emit(TodoErrorState(message: error));
      });
    });
  }
}
