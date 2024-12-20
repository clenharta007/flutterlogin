// ignore_for_file: unused_element

import 'dart:convert';
import 'package:bagong/endpoint/endpoints.dart';
import 'package:bagong/login/login.dart';
import 'package:bagong/utilities/validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget{
  // const RegisterPage({super.key});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage>{
  // Controllers to capture text input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading=true;

  void _register(){
    if(_formKey.currentState?.validate() ?? false){
      print("email: ${_emailController.text}");
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register successfully, please login again!')));
      Navigator.pop(context);

    }
  }

  
  Future<void> _registerAPI() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading=true;
    });

    Object register = {
      "name": _usernameController.text,
      "email": _emailController.text,
      "no_telepon": _phoneController.text,
      "password" : _passwordController.text,
    };
    print(register);
    try{
      final response = await http.post(
        Uri.parse(Endpoints.register),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(register)
      );
      print(response.body);
      if(!mounted) return;
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        if (data['success']) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginObjPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Register failed')),
          );
        }
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    }
    catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Network Error: $e"))
      );

    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  void _backLogin(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)
                ),
                validator: Validators.validateEmail,
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
                validator: Validators.validateName,
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _phoneController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)
                ),
                validator: Validators.validatePhone,
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)
                ),
                validator: Validators.validatePass,
              ),
              SizedBox(height: 16.0,),

              ElevatedButton(
                onPressed: _registerAPI,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 18),
                ), 
                child: Text("Register"),
              ),
              SizedBox(height: 16),

              // back Button
              TextButton(
                onPressed: _backLogin,
                child: Text('Back to Login'),
              ),
            ],
          )

        ),
      ),
    );
  }
}