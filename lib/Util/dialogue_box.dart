import 'package:flutter/material.dart';
import 'package:notepad/Util/MyButtons.dart';

class dialogueBox extends StatelessWidget {

  final controller; 
  VoidCallback onSave;
  VoidCallback onCancel;

  dialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        height: 130,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add your Note",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: 'save', onPressed: onSave),
              const SizedBox(width: 8),
              MyButton(text: 'cancel', onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}

