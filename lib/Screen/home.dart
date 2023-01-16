import 'dart:convert';

import 'package:flutter/material.dart';
import './add_page.dart';
import 'package:http/http.dart' as http;

class Todo_list extends StatefulWidget {
  const Todo_list({super.key});

  @override
  State<Todo_list> createState() => _Todo_listState();
}

class _Todo_listState extends State<Todo_list> {
  //list of array from the endpoint data set
  List items = [];

//loading by default it's true 
  bool isLoading = true;

  //used to render an function to the screen
  @override
  void initState() {
    super.initState();
    //calling the function
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text('Notepad', style: TextStyle(fontSize: 30)),
      ),

      
      body: Visibility(
        visible: isLoading,
        child: Center(
          child: CircularProgressIndicator(),
        ),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) {
                final itemdata = items[index] as Map;
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(itemdata['title']),
                  subtitle: Text(itemdata['description']),
                );
              })),
        ),
      ),

      //
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateTodo_list,
          backgroundColor: Color.fromARGB(224, 33, 2, 173),
          label: Text('+',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ))),
    );
  }

  //functionality for navigate a button
  void navigateTodo_list() {
    final route = MaterialPageRoute(builder: (context) => Addpage());
    Navigator.push(context, route);
  }

  Future<void> fetchTodo() async {
    
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //print(response.statusCode);
    //print(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;

      setState(() {
        items = result;
      });

      setState(() {
        isLoading = false;
      });
    }
  }
}
