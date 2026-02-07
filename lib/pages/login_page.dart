import 'package:flutter/material.dart';
import 'package:learnings/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Image.asset("assets/images/login_image.png",fit: BoxFit.cover,),
                const SizedBox(height: 20,),
                Text("Welcome", style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Emter Username",
                          labelText: "Username"
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",

                      ),
                    ),
                    const SizedBox(height: 40,),
                    ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context,  MyRoutes.HomeRoute);

                    },
                        child: Text("Login"),
                        style:ElevatedButton.styleFrom(
                          minimumSize: Size(150, 30),
                        ),
                      )

                  ],
                ),
              )
              ],
            ),
          ],

        ),
      )
    );
  }
}
