import 'package:flutter/material.dart';
import 'package:pim/screens/forgot_password.dart';
import 'package:pim/screens/home.dart';
import 'package:pim/screens/signup.dart';
import 'package:pim/util/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFC4C4C4).withOpacity(1),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _keyForm,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          FadeIn(
                            child: Text(
                              'Welcome Back !',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 3),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset("assets/images/sign_in.png"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                              ),
                              onSaved: (String? value) {
                                _email = value.toString();
                              },
                              validator: (String? value) {
                                String pattern =
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                if (value == null || value.isEmpty) {
                                  return "Email ne doit pas etre vide";
                                } else if (!RegExp(pattern).hasMatch(value)) {
                                  return "Email incorrect";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.password),
                                labelText: "Password",
                              ),
                              onSaved: (String? value) {
                                _password = value.toString();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Password ne doit pas etre vide";
                                } else if (value.length < 5) {
                                  return "Password doit avoir au moins 5 caractères";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 56,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                                if (_keyForm.currentState!.validate())
                                  _keyForm.currentState!.validate();
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 28),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF019874),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Dont have an Account?"),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword()),
                                    );
                                  },
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      //primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
