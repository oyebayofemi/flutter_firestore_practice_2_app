import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_practice_2_app/edit_page.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference dataCollection =
        FirebaseFirestore.instance.collection('products');

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: dataCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Have soem error');
            }

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  DocumentSnapshot dSnapshot = snapshot.data!.docs[index];
                  return ListTile(
                    leading: IconButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditScreen(dSnapshot),
                              ));
                        },
                        icon: Icon(Icons.edit)),
                    title: Text(dSnapshot['productName']),
                    subtitle: Text(dSnapshot['productPrice']),
                    trailing: IconButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Alert'),
                                  content: Text(
                                      'Are you sure you want to delete this note??'),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await DatabaseService()
                                              .deleteData(dSnapshot);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('No'))
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.delete)),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            }
          }),
    );
  }
}
