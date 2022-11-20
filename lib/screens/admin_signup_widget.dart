import 'package:flutter/material.dart';
//import 'package:csim/screens/admin_signup_widget.dart';

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  // @override
  // _SignupWidgetState createState() {
  //   return _SignupWidgetState();
  // }
  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController storageNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController storageIdController = TextEditingController();
  TextEditingController ownerContactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String serverResponse = 'Server response';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Scaffold(
            body: Container(
                child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'CSIM',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: storageNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cold Storage name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: storageIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cold Storage ID',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: ownerNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Owner Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: ownerContactController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Owner Contact Number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: mailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign up'),
                  onPressed: () {
                    //_makeGetRequest();
                    //_makeLoginRequest(nameController.text, passwordController.text);
                    _makeSignupRequest(storageNameController.text, storageIdController.text, ownerNameController.text, ownerContactController.text, mailController.text, passwordController.text);
                    print(storageNameController.text);
                    print(passwordController.text);
                    print(serverResponse);
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Already have an account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ))));
  }

  _makeSignupRequest(String storageName, String storageId, String ownerName, String ownerContact, String ownerMail, String password) async{
    final url = Uri.parse(_localhost());
    http.Response response = await http.post(url.replace(path: 'admin/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'storagename': storageName,
        'storageid': storageId,
        'ownername': ownerName,
        'ownercontact': ownerContact,
        'email': ownerMail,
        'password': password
      }),);
    print(url);

    setState(() {
      serverResponse = response.body;
    }); print(serverResponse);
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000/';
    else // for iOS simulator
      return 'http://localhost:3000/';
  }
}
