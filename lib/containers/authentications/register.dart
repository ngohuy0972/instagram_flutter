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
        failedDialog();
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
      content: Text("The account already exists for that email."),
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
    final _formKey = GlobalKey<FormState>();
    // create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordConfirmationController =
        TextEditingController();

    var logoLogin = Image.asset(
      'instagram_logo.png',
      width: 50,
      height: 50,
      fit: BoxFit.contain,
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
        TextFormField(
          controller: _passwordConfirmationController,
          validator: (value) {
            if (value!.isEmpty) {
              return "You can't have an empty password confirmation!";
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

            if (value != _passwordController.text) {
              return "Password does not match!";
            }
          },
          decoration: const InputDecoration(labelText: 'Password Confirmation'),
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
          User? user = await registerUsingEmailPassword(
              email: _emailController.text,
              password: _passwordController.text,
              context: context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyStatefulWidget()));
          Future.delayed(const Duration(milliseconds: 1000), () {
            successDialog();
          });
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
      TextButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()))
        },
        child: const Text(
          'Sign In',
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
                      buttonSubmit,
                    ],
                  )),
            )));
  }
}
