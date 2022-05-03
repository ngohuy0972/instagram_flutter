import 'package:flutter/material.dart';
import 'package:instagram_flutter/containers/authentications/login.dart';
import 'package:instagram_flutter/navigation_widget/bottom_nav.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                            //  margin: new EdgeInsets.all(15.0),
                            decoration: const InputDecoration(
                                hintText: 'Email Address'),
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 50,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Password'),
                            keyboardType: TextInputType.visiblePassword,
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
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyStatefulWidget()))
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
                                        builder: (context) =>
                                            const LoginScreen()))
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ]))
                ],
              ),
            )));
  }
}
