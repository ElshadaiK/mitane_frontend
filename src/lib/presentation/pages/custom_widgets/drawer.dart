import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/auth/Login_screen.dart';
import 'package:mitane_frontend/presentation/pages/common/welcome.dart';
import 'package:mitane_frontend/presentation/pages/farmer/home_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[300],
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Logout"),
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LogIn()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("About"),
            leading: IconButton(
              icon: Icon(Icons.help),
              onPressed: () {},
            ),
            onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Mitane 1.0'),
                  content: const Text('A farming digitization flutter app. It serves as pricehub and markethub for users (farmers, traders, farming, accessories, traders/renters)'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Terms and Conditions"),
            leading: IconButton(
              icon: Icon(Icons.note),
              onPressed: () {},
            ),
             onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Terms & Conditions'),
                  content: const Text('A farming digitization flutter app. It serves as pricehub and markethub for users (farmers, traders, farming, accessories, traders/renters) A farming digitization flutter app. It serves as pricehub and markethub for users (farmers, traders, farming, accessories, traders/renters) A farming digitization flutter app. It serves as pricehub and markethub for users (farmers, traders, farming, accessories, traders/renters) A farming digitization flutter app. It serves as pricehub and markethub for users (farmers, traders, farming, accessories, traders/renters)'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Agree'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}
