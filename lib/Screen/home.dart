import 'package:flutter/material.dart';

class Todo_list extends StatefulWidget {
  const Todo_list({super.key});

  @override
  State<Todo_list> createState() => _Todo_listState();
}

class _Todo_listState extends State<Todo_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Note'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Color.fromARGB(224, 33, 2, 173),
          label: Text('+',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )
              )
              ),
    );
  }

  //functionality for navigate

}
