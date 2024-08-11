import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldScreen extends StatelessWidget {
  TextFieldScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal.withOpacity(.5),
          title: Text('local Storage'),
          elevation: 10,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'email or phone',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                if (email.text.isEmpty || password.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('please fill all fields'),
                  ));
                  return;
                }
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('email', email.text);
                prefs.setString('password', password.text);
                print('email: ${email.text} name: ${password.text}');
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  'add data',
                  style: TextStyle(color: Colors.teal),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                String? localdatabaseemail = prefs.getString("email");
                String? localdatabasepass = prefs.getString("password");

                print(
                    'email: $localdatabaseemail password: $localdatabasepass');

                // int? number = prefs.getInt('counter');

                // bool? onboarding = prefs.getBool('isonboarding') ?? false;

                // print('read onboarding $onboarding');
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  'read data',
                  style: TextStyle(color: Colors.teal),
                )),
              ),
            )
          ],
        )));
  }
}
