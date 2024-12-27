import 'dart:convert';

import 'package:bagong/endpoint/endpoints.dart';
import 'package:bagong/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyTokenPage extends StatefulWidget {
  final String? email;
  const VerifyTokenPage({super.key, this.email});

  @override
  _VerifyTokenState createState() => _VerifyTokenState();
}

class _VerifyTokenState extends State<VerifyTokenPage> {
  final TextEditingController _tokenController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  String emailDP = "";

  @override
  void initState() {
    super.initState();

    emailDP = widget.email ?? "";
  }

  void _verifyAPI() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    Object verify = {"email": emailDP, "token": _tokenController.text};
    print(verify);
    try {
      final response = await http.post(Uri.parse(Endpoints.verify),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(verify));

      if (!mounted) return;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

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
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Network Error: $e")));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _backRegister() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Token"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "token has been sent to email $emailDP.\n"
                  "please input the token!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _tokenController,
                  decoration: InputDecoration(
                      labelText: "Insert Token", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: _verifyAPI,
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        textStyle: TextStyle(fontSize: 18)),
                    child: Text("Verify")),
                SizedBox(height: 16),
                TextButton(
                  onPressed: _backRegister,
                  child: Text('Back to Register'),
                ),
              ],
            ),
          )),
    );
  }
}
