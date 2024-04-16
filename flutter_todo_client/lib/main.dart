import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_client/bloc/todo_bloc.dart';
import 'package:flutter_todo_client/bloc/todo_events.dart';
import 'package:flutter_todo_client/data/todo_repo.dart';
import 'package:flutter_todo_client/ui/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todos Graphql',
        theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.pinkAccent,
            elevation: 2,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
          primaryColor: Colors.pinkAccent,
          useMaterial3: true,
        ),
        home: RepositoryProvider<TodoRepository>(
            create: (context) => TodoRepository(),
            child: BlocProvider<TodoBloc>(
                create: (context) => TodoBloc(context.read<TodoRepository>())
                  ..add(GetAllTodos()),
                child: const TodosMainScreen())));
  }
}
