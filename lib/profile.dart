import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
// final  user = await rootBundle.loadString(catalog);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
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
