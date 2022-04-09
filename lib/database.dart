import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> insertData(final product) async {
    //dataCollection.add(product).then((value) => print(value.id));
    dataCollection.add(product).then((value) => product.clear());
  }

  Future<void> deleteData(DocumentSnapshot docEdit) async {
    docEdit.reference.delete();
  }

  Future<void> updateDate(
      String productName, String productPrice, String uid) async {
    // docEdit.reference.update({
    //   'productName': productName,
    //   'productPrice': productPrice,
    // });
    dataCollection.doc(uid).set({
      'productName': productName,
      'productPrice': productPrice,
    });
  }
}
