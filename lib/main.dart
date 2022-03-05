import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pim/screens/edit_profile.dart';
import 'package:pim/screens/forgot_password.dart';
import 'package:pim/screens/signup.dart';
import 'package:pim/screens/signin.dart';
import 'package:pim/screens/splashscreen.dart';
import 'package:pim/util/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:pim/screens/settings.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:pim/screens/world_languages.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyApp(),
    translations: WorldLanguage(), //Language class from world_languages.dart
    locale: Locale('en', 'US'), // translations will be displayed in that locale
    fallbackLocale: Locale('en',
        'US'), // specify the fallback locale in case an invalid locale is selected.
  ));
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
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/editprofile",
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
          },
          "/settings": (BuildContext context) {
            return const Settings();
          }
        },
      ),
    );
  }
}
