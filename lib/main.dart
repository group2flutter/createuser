import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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
        title: Text('Create New User'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Firstname',contentPadding:EdgeInsets.all(9.0)),
              onChanged: (value) => _firstname = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your firstname';
                }
                return null;
              },
              
            ),
              TextFormField(
              decoration: const InputDecoration(labelText: 'lastname',contentPadding:EdgeInsets.all(9.0)),
              onChanged: (value) => _lastname = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your lastname';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email',contentPadding:EdgeInsets.all(9.0)),
              onChanged: (value) => _email = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email address';
                }
                
                return null;
              },
            ),
            TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
           
          ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Retype Password',contentPadding:EdgeInsets.all(9.0)),
              onChanged: (value) => _confirmPassword = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _password) {
                  return 'Passwords do not match';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Create new user
                }
              },
              child: const Text(' New User'),
            ),
          ],
        ),
      ),
    );
  }
  
 }
 