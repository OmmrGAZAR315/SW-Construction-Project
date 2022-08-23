import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Models/Write&Read.dart';
import 'Models/basicmodel.dart';

class readIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffa4bbc6),
      appBar: AppBar(
        shadowColor: Color(0xff00A0F2),
        backgroundColor: Color(0xff00A0F2),
      ),
      body: StreamBuilder<List<BasicModel>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(builduser).toList(),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

Widget builduser(BasicModel user) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(user.id),
      ),
      title: (Text(
        user.email,
        style: TextStyle(fontSize: 15),
      )),
      subtitle: (Text("Password: " + user.password)),
      trailing: bottomsheet(user.id),
    ),
  );
}

class bottomsheet extends StatelessWidget {
  bottomsheet(this.id);

  String id;
  TextEditingController IDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                CircleAvatar(
                  child: Text(
                    id,
                    style: TextStyle(fontSize: 25),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // Text(
                //     //   "Document ID: $id",
                //     //   style: TextStyle(fontSize: 20),
                //     // ),
                //     const SizedBox(
                //       width: 60,
                //     ),
                //     Container(
                //       alignment: Alignment.center,
                //       height: 55,
                //       child: Card(
                //           color: Colors.blue,
                //           child: Text(
                //             "ID: " + id,
                //             style: TextStyle(fontSize: 25),
                //           )),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: customTextfield(
                //     bol: false,
                //     text: 'ID-Update',
                //     ctrler: IDController,
                //     color: Colors.blue,
                //   ),
                // ),
                // ListTile(
                //     leading: Icon(Icons.update),
                //     title: Text("Update"),
                //     onTap: () {
                //       if (IDController.text.isNotEmpty) {
                //         final update = FirebaseFirestore.instance
                //             .collection("SaveIt")
                //             .doc(id);
                //         update.update({
                //           "ID": IDController.text,
                //         });
                //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //             backgroundColor: Colors.green,
                //             content: Text(
                //                 "Updated ${id} to ${IDController.text} successfully,")));
                //       } else {
                //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //             backgroundColor: Colors.redAccent,
                //             content: Text(
                //                 "you can't update without entering ID number")));
                //       }
                //       Navigator.pop(context);
                //       IDController.text = '';
                //     }),
                ListTile(
                  onTap: () {
                    IDController.text = id;
                    final delete =
                        FirebaseFirestore.instance.collection("SaveIt").doc(id);
                    delete.delete();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                            "Deleted ${IDController.text} successfully,")));
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                ),
              ],
            ),
          );
        },
        child: (Icon(Icons.more_vert)));
  }
}
