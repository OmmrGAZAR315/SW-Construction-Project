import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class deleteButton extends StatelessWidget {
  deleteButton({required this.ID});

  TextEditingController ID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.red.shade600,
        onPressed: () {
          print(ID);
          if (ID.text.isNotEmpty) {
            final delete =
                FirebaseFirestore.instance.collection("SaveIt").doc(ID.text);
            delete.delete();
            ID.text = "";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text("Deleted ${ID.text} successfully,")));

          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text("you can't delete without entering ID number")));
          }
        },
        label: Text("Delete"),
      ),
    );
  }
}
