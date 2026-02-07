import 'package:flutter/material.dart';

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
                  fontSize: 25, fontWeight: FontWeight.bold
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
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      print("pressed");
                    },
                        child: Text("Login"),
                        style:TextButton.styleFrom(),
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
