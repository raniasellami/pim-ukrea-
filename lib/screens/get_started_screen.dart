import 'package:flutter/material.dart';
import 'package:pim/screens/signin.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DECOR IT",
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/pim.jpeg"),
              FadeIn(
                child: Text(
                  "After a panoramic shot of a room, Decor It offers you the placement of fourniture and offers you the nearest shozrooms to order",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                duration: Duration(seconds: 3),
              ),
              Container(
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF019874),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
