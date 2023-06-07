import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Create New User Page',
      home: CreateNewUserPage(),
    );
  }
}

class CreateNewUserPage extends StatefulWidget {
  @override
  _CreateNewUserPageState createState() => _CreateNewUserPageState();
}

class _CreateNewUserPageState extends State<CreateNewUserPage> {
  final _formKey = GlobalKey<FormState>();
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _password;
  late String _confirmPassword;
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New User'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Firstname', contentPadding: EdgeInsets.all(9.0)),
              onChanged: (value) => _firstname = value,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'lastname', contentPadding: EdgeInsets.all(9.0)),
              onChanged: (value) => _lastname = value,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email', contentPadding: EdgeInsets.all(9.0)),
              onChanged: (value) => _email = value,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: _obscurePassword,
            ),
          ],
        ),
      ),
    );
  }
}