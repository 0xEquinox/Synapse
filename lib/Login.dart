import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synapse/Serialization/DeserializeXml.dart';
import 'synergy.dart';
import 'package:http/http.dart' as http;
import 'synapse.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var wrongPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: <Widget>[
                    Text((() {
                      if (wrongPass){ return "Incorrect username or password";}
                      return "";
                    })(), style: const TextStyle(color: Colors.red),),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Username',
                      ),
                      controller: usernameController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',

                      ),
                      controller: passwordController,
                    ),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                      GradeBook? gradeBookData = await Synergy.login(usernameController.text, passwordController.text);

                      if (gradeBookData == null) {
                        setState(() {
                          wrongPass = true;
                        });

                        return;
                      }

                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => GradeViewPage(gradeBookData: gradeBookData, title: 'Synapse',)
                          )
                      );
                    },
                  child: const Text('Submit'),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}