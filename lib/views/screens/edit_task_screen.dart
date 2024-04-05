import 'package:auto_route/auto_route.dart';
import 'package:default_project_architecture/utils/const/app_enums.dart';
import 'package:default_project_architecture/utils/models/task_model.dart';
import 'package:default_project_architecture/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/main_textfield.dart';

@RoutePage()
class EditTaskScreen extends StatefulWidget {
  final String? taskUuid;
  final String? taskName;
  final String? taskDescription;
  final TaskStatusEnums? taskStatus;
  const EditTaskScreen({
    super.key,
    this.taskUuid,
    this.taskName,
    this.taskDescription,
    this.taskStatus,
  });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  String taskStatusController = TaskStatusEnums.values.first.value;

  List<String> taskStatusInList = TaskStatusEnums.values.map((e) => (e.value)).toList();

  @override
  void initState() {
    widget.taskName != null ? taskNameController.text = widget.taskName.toString() : null;
    widget.taskDescription != null ? taskDescriptionController.text = widget.taskDescription.toString() : null;
    widget.taskStatus != null ? taskStatusController = widget.taskStatus!.value : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBarTitle: widget.taskUuid == null ? "Add task" : "Edit task"),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: [
          const SizedBox(height: 12),
          MainTextField(taskNameController: taskNameController, label: "Task name"),
          const SizedBox(height: 12),
          MainTextField(taskNameController: taskDescriptionController, label: "Task description", maxLines: 3),
          const SizedBox(height: 12),
          ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField(
              value: taskStatusController,
              menuMaxHeight: 200,
              style: const TextStyle(color: Colors.white),
              padding: const EdgeInsets.symmetric(vertical: 12),
              onChanged: (String? value) {
                taskStatusController = value.toString();
                setState(() {});
              },
              items: taskStatusInList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              dropdownColor: Colors.blueGrey,
              iconSize: 0,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                labelText: 'Task status',
                labelStyle: const TextStyle(color: Colors.white70),
                alignLabelWithHint: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(widget.taskUuid == null ? Icons.add_outlined : Icons.edit_outlined),
        onPressed: () {
          print(TaskModel(
            taskId: widget.taskUuid != null ? widget.taskUuid! : const Uuid().v1(),
            taskName: taskNameController.text,
            taskDescription: taskDescriptionController.text,
            taskStatus: parseTaskStatus(taskStatusController),
          ));
        },
      ),
    );
  }
}
