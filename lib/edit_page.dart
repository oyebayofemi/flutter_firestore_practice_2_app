import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_practice_2_app/database.dart';
import 'package:firestore_practice_2_app/product_model.dart';
import 'package:firestore_practice_2_app/textformfield_decoration.dart';
import 'package:firestore_practice_2_app/view_page.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  late DocumentSnapshot docEdit;

  EditScreen(this.docEdit);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //String productName = widget.docEdit['productName'];
    final productController =
        TextEditingController(text: widget.docEdit['productName']);
    //String productPrice = widget.docEdit['productPrice'];
    final priceController =
        TextEditingController(text: widget.docEdit['productPrice']);
    // final productIDController =
    //     TextEditingController(text: widget.docEdit['uid']);

    //String productID = widget.docEdit['uid'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            // onChanged: (value) {
            //   setState(() {
            //     productName = value;
            //   });
            // },
            controller: productController,
            decoration: textFormDecoration().copyWith(hintText: 'Product Name'),
          ),
          TextFormField(
            // onChanged: (value) => setState(() {
            //   productPrice = value;
            // }),
            controller: priceController,
            decoration:
                textFormDecoration().copyWith(hintText: 'Product Price'),
          ),
          FlatButton(
              color: Colors.orange,
              onPressed: () async {
                String productName = productController.text;
                String productPrice = priceController.text;
                final ProductModel product = ProductModel(
                    productName: productName, productPrice: productPrice);

                await DatabaseService()
                    .updateDate(productName, productPrice, widget.docEdit.id);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              )),
          FlatButton(
              color: Colors.orange,
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPage(),
                    ));
              },
              child: Text(
                'View Data',
                style: TextStyle(color: Colors.white),
              ))
        ],
      )),
    );
  }
}
