import 'package:flutter/material.dart';
import 'package:pim/screens/signin.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pim/util/api.dart';
import 'dart:convert';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _password;
  late String _phonenumber;
  late String _adress;
  late String _datedenaissance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC4C4C4).withOpacity(1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _keyForm,
          child: ListView(
            children: [
              FadeIn(
                child: Text(
                  'registerwithus'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                duration: Duration(seconds: 3),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeIn(
                child: Text(
                  ("saveinfo".tr),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
                duration: Duration(seconds: 3),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.verified_user),
                    labelText: "enterfirstname".tr,
                  ),
                  onSaved: (String? value) {
                    _firstname = value.toString();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "first name ne doit pas etre vide";
                    } else if (value.length < 5) {
                      return "first name doit avoir au moins 5 caractères";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.verified_user),
                    labelText: "lastname".tr,
                  ),
                  onSaved: (String? value) {
                    _lastname = value.toString();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "last name ne doit pas etre vide";
                    } else if (value.length < 5) {
                      return "last name doit avoir au moins 5 caractères";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone),
                    labelText: "phone".tr,
                  ),
                  onSaved: (String? value) {
                    _phonenumber = value.toString();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "PhoneNumber ne doit pas etre vide";
                    } else if (value.length != 8) {
                      return "PhoneNumber doit avoir au moins 8 caractères";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "enteremail".tr,
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
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.password),
                    labelText: "enterpassword".tr,
                  ),
                  onSaved: (String? value) {
                    _password = value.toString();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Username ne doit pas etre vide";
                    } else if (value.length < 5) {
                      return "Username doit avoir au moins 5 caractères";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "enteradress".tr,
                  ),
                  onSaved: (String? value) {
                    _adress = value.toString();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "enterbirthday".tr,
                  ),
                  onSaved: (String? value) {
                    _datedenaissance = value.toString();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_keyForm.currentState!.validate())
                      _keyForm.currentState!.save();
                    Map<String, dynamic> userData = {
                      "firstName": _firstname,
                      "lastName": _lastname,
                      "email": _email,
                      "birthDate": _datedenaissance,
                      "address": _adress,
                      "phoneNumber": _phonenumber * 1,
                      "password": _password
                    };

                    Map<String, String> headers = {
                      "Content-Type": "application/json; charset=UTF-8"
                    };

                    http
                        .post(Uri.http(api_key, "/usersPim/signup"),
                            headers: headers, body: json.encode(userData))
                        .then((http.Response response) {
                      if (response.statusCode == 201) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      } else if (response.statusCode == 402) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("Email already exists"),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("There's a problem"),
                            );
                          },
                        );
                      }
                    });
                  },
                  child: Text(
                    'signupp'.tr,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    },
                    child: Text(
                      'alreadyhave'.tr,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
