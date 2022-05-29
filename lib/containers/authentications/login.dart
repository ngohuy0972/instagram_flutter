import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/authentications/register.dart';
import 'package:instagram_flutter/navigation_widget/bottom_nav.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  // Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "wrong-password") {
        print('Wrong password provided for that user.');
      }
    }
    return user;
  }

  void successDialog() {
    const alert = CupertinoAlertDialog(
      title: Text("Log In"),
      content: Text("Login successfully"),
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
      title: Text("Log In"),
      content: Text("Login failed"),
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

    var logoLogin = Image.asset(
      'instagram_logo.png',
      height: 50,
    );

    var inputComponent = Column(
      children: <Widget>[
        TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return "You can't have an empty email!";
            }

            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return "Please enter a valid email address";
            }

            if (value.length > 50) {
              return "Email does not exceed 50 characters!";
            }
          },
          decoration: const InputDecoration(labelText: 'Email Address'),
          keyboardType: TextInputType.emailAddress,
          maxLength: 50,
        ),
        TextFormField(
          controller: _passwordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "You can't have an empty password!";
            }

            if (!RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9_])')
                .hasMatch(value)) {
              return "Password includes uppercases, special characters";
            }

            if (value.length < 6) {
              return "Password must be least 6 characters";
            }

            if (value.length > 20) {
              return "Password does not exceed 20 characters!";
            }
          },
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
          maxLength: 20,
        ),
      ],
    );

    var buttonSubmit =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        onPressed: () async {
          _formKey.currentState!.validate();
          User? user = await loginUsingEmailPassword(
              email: _emailController.text,
              password: _passwordController.text,
              context: context);
          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyStatefulWidget()));
            Future.delayed(const Duration(milliseconds: 1000), () {
              successDialog();
            });
          } else {
            failedDialog();
          }
        },
        child: const Text(
          'Sign In',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
      TextButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Register()))
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      )
    ]);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            margin: const EdgeInsets.all(20.0), // Or set whatever you want
            child: SafeArea(
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(
                        height: 100,
                      ),
                      logoLogin,
                      inputComponent,
                      const SizedBox(
                        height: 50,
                      ),
                      buttonSubmit,
                    ],
                  )),
            )));
  }
}
