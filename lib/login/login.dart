// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:bagong/Login/register.dart';
import 'package:bagong/endpoint/endpoints.dart';
import 'package:bagong/mainpage/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginObjPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginObjPage>{
  // Controllers to capture text input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading=false;

  // Method to handle login
  // #region reg
  void _login() async{
    if (_formKey.currentState?.validate() ?? false){
      // For now, just print the values
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');

      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 5));
      // Navigate to another page or show success message
      // For now, we just clear the fields
      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged in successfully')));
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => MainPage()
        )
      );
    }
  }
  // #endregion

  // Future<void> _LoginAPI() async {
  //   if (!_formKey.currentState!.validate()) return;
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   Object login= {
  //     "username" : _usernameController.text,
  //     "password" : _passwordController.text
  //   };
  //
  //   try{
  //     final response = await http.post(
  //       Uri.parse(Endpoints.login),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(login)
  //     );
  //
  //     if(response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       if (data['success']) {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => MainPage()),
  //         );
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(data['message'] ?? 'Login failed')),
  //         );
  //       }
  //     }
  //     else{
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Server error: ${response.statusCode}')),
  //       );
  //     }
  //   }catch(e){
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Network error: $e')),
  //     );
  //   }
  // }

  //Method redirect page
  void _toRegister(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage()
      ),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "user empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0,),
              
              isLoading ? 
                CircularProgressIndicator()
                :
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(fontSize: 18),
                  ), 
                  child: Text("Login"),
                ),
              SizedBox(height: 16),
              
              // Register Button
              TextButton(
                onPressed: _toRegister,
                child: Text('Don\'t have an account? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}