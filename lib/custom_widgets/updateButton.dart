import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updateButton extends StatelessWidget {
  updateButton(
      {required this.ID,
      required this.email,
      required this.pass});

  TextEditingController ID;
  TextEditingController email;
  TextEditingController pass;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.green.shade400,
      onPressed: () {
        if (ID.text.isNotEmpty) {
          final update =
              FirebaseFirestore.instance.collection("SaveIt").doc(ID.text);
          update.update({
            "ID": ID.text,
            "Email": email.text,
            "Password": pass.text,
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text("Updated ${ID.text} successfully,")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("you can't update without entering ID number")));
        }
      },
      label: Text("Update"),
    );
  }
}
