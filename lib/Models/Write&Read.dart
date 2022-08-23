import 'package:cloud_firestore/cloud_firestore.dart';

import 'basicmodel.dart';

Future createrUser(BasicModel user, String index) async {
  final dataBase = FirebaseFirestore.instance.collection("SaveIt").doc(index);
  user.id = index;
  final json = user.tojson();
  await dataBase.set(json);
}

Stream<List<BasicModel>> readUsers() => FirebaseFirestore.instance
    .collection("SaveIt")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => BasicModel.fromjson(doc.data())).toList());
