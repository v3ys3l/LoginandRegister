import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  late String email, password;
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
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Sign Up",
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
                      email = value!;
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
                      password = value!;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: SignIn,
                    child: Text("Sign up"),
                  ),
                ),
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/loginPage"),
                    child: Text(
                      "I already have an account",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void SignIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      try {
        var userResult = await fbAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        formkey.currentState!.reset();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("successfully logged in..")));
        Navigator.pushNamed(context, "/homePage");
      } catch (e) {
        print(e.toString());
      }
    } else {}
  }
}
