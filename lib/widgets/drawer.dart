import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageURL =
      "https://media.licdn.com/dms/image/v2/D4D03AQHQo04Xq-fEpg/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1689866353942?e=2147483647&v=beta&t=HI1gTgdnoJYnWqViGaPLnpu8c8ZxOdjT5oWg0Pw3iXE";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Mansoor Shehzad"),
                accountEmail: Text("mansoor.shehzad.33@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text(
                "Email Me",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
