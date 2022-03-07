import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xFF363f93),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 20,
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF363f93),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // const SizedBox(height: height*0.05,width: ,),
          Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  child: Material(
                    child: Container(
                      height: 180.0,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: new Offset(-10.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 2,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/ukrea.jpeg'))),
                    ),
                  ),
                ),
                Positioned(
                    top: 45,
                    left: 160,
                    child: Container(
                      height: 150,
                      width: 180,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              "Ukrea vous propose des créations uniques à partir d'une combinaison entre le bois et des matériaux bruts et authentiques.",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF363f93),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF363f93),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0),
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: Color(0xFF363f93).withOpacity(0.3),
                        offset: new Offset(-10.0, 10.0),
                        blurRadius: 20.0,
                        spreadRadius: 4.0),
                  ],
                ),
                padding: const EdgeInsets.only(
                  left: 32,
                  top: 50.0,
                  bottom: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Facebook:    https://www.facebook.com/meubleenboisnaturel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Phone:          92260642",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Hourly:          12:00-18:00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
