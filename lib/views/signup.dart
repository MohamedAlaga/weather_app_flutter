import 'package:flutter/material.dart';
import 'package:weather_app_2/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
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
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                controller: passController,
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ConfirmPassword',
                ),
                controller: confirmPassController,
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () async {
                  try{
                  if (passController.text == confirmPassController.text) {
                    print('passwords match');
                    bool res = await SignupController(emailController.text, passController.text);
                      if(res){
                    print('user created');
                    Navigator.pop(context);
                      }
                  }} catch (e) {
                    print(e);
                  }
                },
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
