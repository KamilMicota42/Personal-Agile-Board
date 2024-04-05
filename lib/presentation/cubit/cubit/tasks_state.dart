part of 'tasks_cubit.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loading() = _Loading;
  const factory TasksState.success({required List<TaskModel> tasks}) = _Success;
  const factory TasksState.error({required String error}) = _Error;
}
