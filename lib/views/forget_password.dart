import 'package:flutter/material.dart';
import 'package:weather_app_2/controller/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/Icon.png'),
                width: 200,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                controller: emailController,
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () {
                    ForgetPasswordController(emailController.text);
                    Navigator.pop(context);
                  },
                  child: Text("Send Email")),
            ],
          ),
        ),
      ),
    );
  }
}
