import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/authentications/login.dart';
import 'package:instagram_flutter/navigation_widget/bottom_nav.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // create a new user
  Future<User?> registerUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userRegister = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userRegister.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void successDialog() {
    const alert = CupertinoAlertDialog(
      title: Text("Register"),
      content: Text("Sign up successfully"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void failedDialog() {
    const alert = CupertinoAlertDialog(
      title: Text("Register"),
      content: Text("Sign up failed"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Material(
        child: Container(
            margin: const EdgeInsets.all(20.0), // Or set whatever you want
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Image.asset(
                        'instagram_logo.png',
                        width: 200,
                        fit: BoxFit.contain,
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                hintText: 'Email Address'),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 50,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(hintText: 'Password'),
                            obscureText: true,
                            maxLength: 20,
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 4,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50)),
                              onPressed: () async {
                                User? user = await registerUsingEmailPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context);
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyStatefulWidget()));
                                  successDialog();
                                } else {
                                  failedDialog();
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            TextButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50)),
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()))
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ])),
                ],
              ),
            )));
  }
}
