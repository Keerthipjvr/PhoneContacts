import 'package:flutter/material.dart';
import 'package:phonecontacts/contactPage.dart';
import 'package:phonecontacts/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'LogIn App',
    home: const LoginPage(),
  ));
}

class Decider extends StatefulWidget {
  const Decider({Key? key}) : super(key: key);

  @override
  State<Decider> createState() => _DeciderState();
}

class _DeciderState extends State<Decider> {
  SharedPreferences? prefs;
  bool isLoading = false;
  getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  initState() {
    getSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : prefs?.getString("Login Successfully completed") == null
            ? LoginPage()
            : ContactsPage();
  }
}
