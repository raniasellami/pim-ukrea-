import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pim/screens/edit_profile.dart';
import 'package:pim/main.dart';
import 'package:pim/screens/signin.dart';
import 'package:pim/screens/signup.dart';
import 'world_languages.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("settings".tr),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUp()),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
          ],
        ),
        body: Row(
          children: [
            Container(
                child: IconButton(
              icon: Image.asset('assets/icons/tn.jpeg'),
              iconSize: 50,
              onPressed: () {
                var locale = Locale('ru', 'RU');
                Get.updateLocale(locale);
              },
            )),
            Container(
                child: IconButton(
              icon: Image.asset('assets/icons/fr.webp'),
              iconSize: 50,
              onPressed: () {
                var locale = Locale('es', 'ES');
                Get.updateLocale(locale);
              },
            )),
            Container(
                child: IconButton(
              icon: Image.asset('assets/icons/usa.webp'),
              iconSize: 50,
              onPressed: () {
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
              },
            )),
          ],
        ),
      ),
    );
  }
}
