import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late String _email, _password;
  final formkey = GlobalKey<FormState>();
  final fbAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.deepPurple[500],
        body: Card(
          //color: Colors.deepPurple[100],
          color: Colors.white,
          margin: EdgeInsets.only(left: 10, right: 10, top: 110),
          child: Card(
            color: Colors.deepPurple[300],
            child: Form(
              key:formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20, top: 50),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "fill in the information completely";
                        } else {}
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20, top: 40),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "fill in the information completely";
                        } else {}
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: ()async{
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          try { 
                          final userResult = await fbAuth.signInWithEmailAndPassword(email: _email, password: _password);
                          Navigator.pushNamed(context, "/homePage");
                          print(userResult.user!.email); 
                          } catch (e) {
                            print(e.toString()); 
                          }
                        } else {}
                      },
                      child: Text("Login"),
                    ),
                  ),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/singUpPage"),
                      child: Text(
                        "create Account",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
