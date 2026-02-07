import 'package:flutter/material.dart';
import 'package:learnings/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
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
                Text("Welcome $name", style: TextStyle(
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
                          hintText: "Enter Username",
                          labelText: "Username"
                      ),
                          onChanged: (value){
                          name = value;
                            setState(() {

                            });
                            },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",

                      ),
                    ),
                    const SizedBox(height: 40,),

                    InkWell(
                      onTap: () async {
                       //
                        setState(() {
                          changedButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context,  MyRoutes.HomeRoute);

                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changedButton? 50 : 150,
                        height: 30,

                        alignment: Alignment.center,
                        child: changedButton?Icon(Icons.done,color: Colors.white ,): Text("Login",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,
                        ),),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          //shape: changedButton?BoxShape.circle :BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(changedButton? 50: 10),
                        ),

                      ),
                    )
                    // ElevatedButton(onPressed: (){
                    //   Navigator.pushNamed(context,  MyRoutes.HomeRoute);
                    //
                    // },
                    //     child: Text("Login"),
                    //     style:ElevatedButton.styleFrom(
                    //       minimumSize: Size(150, 30),
                    //     ),
                    //   )

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
