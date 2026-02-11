import 'package:flutter/material.dart';
import 'package:learnings/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  final _FormKey = GlobalKey<FormState>();

  MoveToHome(BuildContext context)async{
    if(_FormKey.currentState!.validate()){
    setState(() {
      changedButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context,  MyRoutes.HomeRoute);
    setState(() {
      changedButton = false;
    });

  }}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _FormKey,
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset("assets/images/hey.png",fit: BoxFit.cover,),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },

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
                        validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return "Password cannot be empty";
                          } else if (value.length < 6){
                            return "Password length should be at least 6";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 40,),
          
                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changedButton? 50: 10),
          
                        child: InkWell(
                          onTap: ()  => MoveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changedButton? 50 : 150,
                            height: 30,
          
                            alignment: Alignment.center,
                            child: changedButton?Icon(Icons.done,color: Colors.white ,): Text("Login",style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,
                            ),),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple,
                            //   //shape: changedButton?BoxShape.circle :BoxShape.rectangle,
                            // ),
          
                          ),
                        ),
                      )
          
                    ],
                  ),
                )
                ],
              ),
            ],
          
          ),
        ),
      )
    );
  }
}
