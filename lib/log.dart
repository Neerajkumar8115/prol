import 'package:flutter/material.dart';
import 'package:proj/services/api_service.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  final ApiServices apiServices = ApiServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _jobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Full Name'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Job Name'),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter you job title";
                  } else if (value.length < 6) {
                    return "Minimum 6 character required*";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              //successfull
              //  Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => profile()));

              apiServices.createAccount(_nameController.text.toString(),
                  _jobController.text.toString(), context);
            }
          },
          child: const Text('Submit'),
        ),
      ),
    );
  }
}
