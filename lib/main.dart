import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_login/authService.dart';

import 'NextScreen.dart';

/*
* print SHA
 * ./gradlew signingReport
 * 
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// List<String> colo = ['#eb3734', '#ebd934']; // Color Highlight

class MyApp extends StatelessWidget {
  var co = Colors.amber;
  //var gr = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Login Demo',
      home: LoginScreen(title: 'Login Screen'),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                await AuthService().signInWithGoogle().then((value) {
                  print(value);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NextScreen(
                              auth.currentUser!.displayName,
                              auth.currentUser!.email,
                              auth.currentUser!.phoneNumber)));
                });

                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => NextScreen('name')));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image(
                  //   image: AssetImage('assets/googleIcon.png'),
                  //   width: 28,
                  //   height: 28,
                  // ),
                  SizedBox(width: 10.0),
                  Text('Sign in with Google')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
