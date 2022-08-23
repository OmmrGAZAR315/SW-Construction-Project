import 'package:flutter/material.dart';

import 'custom_widgets/customButton.dart';
import 'custom_widgets/textField.dart';

class signUp extends StatelessWidget {
  String url = "https://1password.com/img/logo-v1-min.png";
  TextEditingController emailSignup = TextEditingController();
  TextEditingController passwordSignup = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00A0F2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 55,
            ),
            Image.network(
              url,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "OnePassword",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: "Pacifico"),
                ),
              ],
            ),
            const SizedBox(
              height: 75,
            ),
            Text(
              "Register",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            customTextfield(
              bol: false,
              text: 'Email',
              ctrler: emailSignup,
              color: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            customTextfield(
              bol: false,
              text: 'Password',
              ctrler: passwordSignup,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            customButton(
              button: 'Register',
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "  Sign In",
                    style: TextStyle(color: Color(0xffCFEFEA), fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
