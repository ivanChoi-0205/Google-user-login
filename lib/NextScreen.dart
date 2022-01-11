import 'package:flutter/material.dart';
import 'package:user_login/authService.dart';

class NextScreen extends StatelessWidget {
  // const NextScreen({ Key? key }) : super(key: key);
  final name;
  final email;
  final phoneNumber;
  NextScreen(this.name, this.email, this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NextScreen'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Text('$name\n$email\n$phoneNumber'),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  AuthService().signOutGoogle();
                  Navigator.pop(context);
                },
                child: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
