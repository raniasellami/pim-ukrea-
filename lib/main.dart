import 'package:flutter/material.dart';
import 'package:pim/screens/edit_profile.dart';
import 'package:pim/screens/forgot_password.dart';
import 'package:pim/screens/signup.dart';
import 'package:pim/screens/signin.dart';
import 'package:pim/screens/splashscreen.dart';
import 'package:pim/util/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/splashscreen",
        routes: {
          "/splashscreen": (BuildContext context) {
            return const SignIn();
          },
          "/signup": (BuildContext context) {
            return const SignUp();
          },
          "/splashscreen": (BuildContext context) {
            return const SplahScreen();
          },
          "/editprofile": (BuildContext context) {
            return const EditProfile();
          },
          "/forgotpassword": (BuildContext context) {
            return const ForgotPassword();
          }
        },
      ),
    );
  }
}
