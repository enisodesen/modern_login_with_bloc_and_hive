import 'package:flutter/material.dart';
import 'package:modern_login_page/widgets/custom_button.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox(
      {super.key,
      required this.textController,
      required this.urgentController,
      required this.onSave,
      required this.onCancel});

  final TextEditingController textController;
  final TextEditingController urgentController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[700],
      content: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new task'),
          ),
          TextField(
            controller: urgentController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Is it urgent'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(onTapped: onSave, text: 'Save'),
              const SizedBox(
                width: 10,
              ),
              CustomButton(onTapped: onCancel, text: 'Cancel'),
            ],
          ),
        ],
      ),
    );
  }
}
