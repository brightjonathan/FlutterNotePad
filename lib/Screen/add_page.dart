import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  //all function

  //controller to handle the text field
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Note'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Note something down'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: submitData, child: const Text('Submit'))
        ],
      ),
    );
  }

//SUBMIT FUNCTIONALITY TO THE DATABASE
  Future<void> submitData() async {
    //getting the data from the form
    final title = titleController.text;
    final desc = descriptionController.text;

    final databody = {
      "title": title,
      "description": desc,
      "is_completed": false
    };

    //submitting data to the https://api.nstack.in/#/Todo/TodoController_create server
    final url = 'https://api.nstack.in/v1/todos'; //api link
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(databody),
        headers: {'content-type': 'application/json'});

    //show the output
    if (response.statusCode == 201) {
      showSuccessMessage('created successfully');
    } else {
      showErrorMessage('Creation Failed');
    }

  }

  //show success message
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //show error message
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}

