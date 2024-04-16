import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String content;
  final bool completed;

  const Todo({
    required this.id,
    required this.title,
    required this.content,
    this.completed = false,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      completed: json['completed'],
    );
  }

  Todo copyWith({
    String? id,
    String? title,
    String? content,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'completed': completed,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        completed,
      ];
}
