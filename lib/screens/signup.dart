import 'package:flutter/material.dart';
import 'package:pim/screens/signin.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _password;
  late String _phonenumber;
  late String _adress;
  late String _datedenaissance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration',
          style: TextStyle(fontSize: 29),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _keyForm,
          child: ListView(
            children: [
              FadeIn(
                child: Text(
                  'Register With Us!',
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
                  'Your Information is safe with us',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
                duration: Duration(seconds: 3),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: "Enter your full name",
                ),
                onSaved: (String? value) {
                  _username = value.toString();
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: "Enter your PhoneNumber",
                ),
                onSaved: (String? value) {
                  _username = value.toString();
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: "Enter your email",
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: "Enter your password",
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: "Enter your adress",
                ),
                onSaved: (String? value) {
                  _adress = value.toString();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  labelText: "Enter your Birthday",
                ),
                onSaved: (String? value) {
                  _adress = value.toString();
                },
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
                        _keyForm.currentState!.validate();
                    },
                    child: const Text('signup'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ))),
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
                      'Already have an account? Sign In',
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
