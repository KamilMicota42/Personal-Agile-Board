import 'dart:convert';

import 'package:default_project_architecture/utils/const/app_enums.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String taskId;
  final String? taskName;
  final String? taskDescription;
  final TaskStatusEnums? taskStatus;

  const TaskModel({
    required this.taskId,
    this.taskName,
    this.taskDescription,
    this.taskStatus,
  });

  factory TaskModel.fromMap(Map<String, dynamic> data) => TaskModel(
        taskId: data['taskId'] as String,
        taskName: data['taskName'] as String?,
        taskDescription: data['taskDescription'] as String?,
        taskStatus: data['taskStatus'] as TaskStatusEnums?,
      );

  Map<String, dynamic> toMap() => {
        'taskId': taskId,
        'taskName': taskName,
        'taskDescription': taskDescription,
        'taskStatus': taskStatus,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TaskModel].
  factory TaskModel.fromJson(String data) {
    return TaskModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TaskModel] to a JSON string.
  String toJson() => json.encode(toMap());

  TaskModel copyWith({
    required String taskId,
    String? taskName,
    String? taskDescription,
    TaskStatusEnums? taskStatus,
  }) {
    return TaskModel(
      taskId: this.taskId,
      taskName: taskName ?? this.taskName,
      taskDescription: taskDescription ?? this.taskDescription,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      taskId,
      taskName,
      taskDescription,
      taskStatus,
    ];
  }
}
