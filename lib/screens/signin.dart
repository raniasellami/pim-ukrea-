import 'package:flutter/material.dart';
import 'package:pim/screens/forgot_password.dart';
import 'package:pim/screens/home.dart';
import 'package:pim/screens/signup.dart';
import 'package:pim/util/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:pim/util/api.dart';
import 'dart:convert';
import 'package:pim/screens/world_languages.dart';
import 'package:pim/main.dart';
import 'package:get/get.dart';
import 'package:pim/screens/settings.dart';

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
                              ("welcome".tr),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 3),
                          ),
                          SizedBox(
                            height: 42,
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email),
                                labelText: ("email".tr),
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
                                labelText: ("password".tr),
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
                                if (_keyForm.currentState!.validate())
                                  _keyForm.currentState!.save();

                                Map<String, dynamic> userData = {
                                  "email": _email,
                                  "password": _password
                                };

                                Map<String, String> headers = {
                                  "Content-Type":
                                      "application/json; charset=UTF-8"
                                };

                                http
                                    .post(Uri.http(api_key, "/usersPim/signin"),
                                        headers: headers,
                                        body: json.encode(userData))
                                    .then((http.Response response) async {
                                  if (response.statusCode == 201) {
                                    Map<String, dynamic> userFromServer =
                                        json.decode(response.body);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignUp()),
                                    );
                                  } else if (response.statusCode == 401) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            title: Text("Information"),
                                            content:
                                                Text("Password is incorrect"),
                                          );
                                        });
                                  } else if (response.statusCode == 402) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            title: Text("Information"),
                                            content:
                                                Text("Email doesn't exist"),
                                          );
                                        });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            title: Text("Information"),
                                            content: Text(
                                                "Une erreur s'est produite. Veuillez réessayer !"),
                                          );
                                        });
                                  }
                                });
                              },
                              child: Text(
                                "Login".tr,
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
                                  Text("account".tr),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()),
                                      );
                                    },
                                    child: Text(
                                      "signup".tr,
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
                                  child: Text(
                                    'ForgotPassword'.tr,
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
