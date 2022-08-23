import 'package:flutter/material.dart';

import 'Models/Write&Read.dart';
import 'Models/basicmodel.dart';
import 'custom_widgets/customButton.dart';
import 'custom_widgets/deleteButton.dart';
import 'custom_widgets/textField.dart';
import 'custom_widgets/updateButton.dart';

class saveIt extends StatelessWidget {
  String url = "https://1password.com/img/logo-v1-min.png";
  TextEditingController IDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xff00A0F2),
      body: Form(
        key: form,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  IDController.text = '';
                  emailController.text = '';
                  webController.text = '';
                  passController.text = '';
                  Navigator.pushNamed(context, "readit");
                },
                child: Image.network(
                  url,
                  height: 100,
                ),
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
                height: 50,
              ),
              customTextfield(
                bol: false,
                text: 'ID',
                ctrler: IDController,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              customTextfield(
                bol: false,
                text: 'Email',
                ctrler: emailController,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              customTextfield(
                bol: false,
                text: 'Website Address',
                text2: "example: Google.com , Microsoft.com...etc",
                ctrler: webController,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              customTextfield(
                bol: true,
                text: 'Password',
                ctrler: passController,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (form.currentState!.validate()) {
                    BasicModel user = BasicModel(
                      id: IDController.text,
                      email: emailController.text,
                      web: webController.text,
                      password: passController.text,
                    );
                    createrUser(user, IDController.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blueGrey,
                        content: Text(
                            "Added ${IDController.text} to OnePassword! successfully,")));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blueGrey,
                        content: Text(
                            "To Check on your Accounts press on image above")));
                    IDController.text = '';
                    emailController.text = '';
                    webController.text = '';
                    passController.text = '';
                  }
                },
                child: customButton(
                  button: 'Save it',
                ),
              ),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          deleteButton(
            ID: IDController,
          ),
          updateButton(
              ID: IDController, email: emailController, pass: passController),
        ],
      ),
    );
  }
}
