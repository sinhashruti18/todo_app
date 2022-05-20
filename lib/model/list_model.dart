// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListModel {
  String task;
  ListModel(
    this.task,
  );

  ListModel copyWith({
    String? task,
  }) {
    return ListModel(
      task ?? this.task,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
    };
  }

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(
      map['task'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListModel.fromJson(String source) => ListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListModel(task: $task)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ListModel &&
      other.task == task;
  }

  @override
  int get hashCode => task.hashCode;
}
