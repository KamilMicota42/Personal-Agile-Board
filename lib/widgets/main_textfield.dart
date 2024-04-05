import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final String label;
  final TextEditingController taskNameController;
  final int? maxLines;
  const MainTextField({
    super.key,
    required this.label,
    required this.taskNameController,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskNameController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        labelText: label,
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
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines ?? 1,
    );
  }
}
