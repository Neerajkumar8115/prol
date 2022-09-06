import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse("https://reqres.in/"));
    return jsonDecode(result.body)['result'];
  }

  @override
  void initState() {
    var response = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(''),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
