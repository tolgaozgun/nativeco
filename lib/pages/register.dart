import 'package:flutter/material.dart';
import 'package:nativeco/components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: RegisterForm(),
    );
  }
}
