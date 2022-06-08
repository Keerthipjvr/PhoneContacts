import 'package:flutter/material.dart';
import 'package:phonecontacts/contactPage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences? prefs;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCntrlr = TextEditingController();
  TextEditingController pwdCntrlr = TextEditingController();
  String email = 'abcd@gmail.com';
  String pwd = '12345678';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter Email id';
                  }
                  return null;
                },
                controller: emailCntrlr,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    labelText: 'E-mail id',
                    labelStyle: TextStyle(
                      color: Colors.purple,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter Password';
                  } else if (value != null && value.length < 6) {
                    return 'Please enter atleast 6 Characters';
                  }
                  return null;
                },
                controller: pwdCntrlr,
                obscureText: true,
                style: TextStyle(
                  color: Colors.red,
                ),
                autofocus: false,
                obscuringCharacter: '.',
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.green),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    if (emailCntrlr.text == email && pwdCntrlr.text == pwd) {
                      
                      prefs?.setString("Login Successful", "true");
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactsPage()));
                    }
                  } else {
                    Alert(
                            context: context,
                            title: "Login Failed",
                            desc: "Invalid E-mail or Password")
                        .show();
                  }
                },
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                //color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
