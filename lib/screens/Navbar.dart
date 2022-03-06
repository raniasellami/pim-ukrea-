import 'package:flutter/material.dart';
import 'package:pim/screens/settings.dart';
import 'package:pim/screens/signin.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Makki'),
            accountEmail: Text('makki.benmbarek@esprit.tn'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/icons/tn.jpeg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&w=1000&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.mode),
            title: Text('Mode Sombre'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              ),
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(' Language'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
