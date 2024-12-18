import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  // const RegisterPage({super.key});
  @override
  _RegisterState createState() => _RegisterState();
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Register"),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Text(
  //             "Register page",
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           ElevatedButton(
  //             onPressed: (){
  //               Navigator.pop(context);
  //             }, 
  //             child: const Text("back to login"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class _RegisterState extends State<RegisterPage>{
  // Controllers to capture text input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register(){
    if(_formKey.currentState?.validate() ?? false){
      print("email: ${_emailController.text}");
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register successfully, please login again!')));
      Navigator.pop(context);

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
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "email empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
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
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)
                ),
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "password empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0,),

              ElevatedButton(
                onPressed: _register,
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