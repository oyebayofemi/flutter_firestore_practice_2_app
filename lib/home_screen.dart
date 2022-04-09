import 'package:firestore_practice_2_app/database.dart';
import 'package:firestore_practice_2_app/product_model.dart';
import 'package:firestore_practice_2_app/textformfield_decoration.dart';
import 'package:firestore_practice_2_app/view_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String productName;
  late String productPrice;
  final productnameController = TextEditingController();
  final productpriceController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            controller: productnameController,
            onChanged: (value) {
              setState(() {
                productName = value;
              });
            },
            decoration: textFormDecoration().copyWith(hintText: 'Product Name'),
          ),
          TextFormField(
            controller: productpriceController,
            onChanged: (value) => setState(() {
              productPrice = value;
            }),
            decoration:
                textFormDecoration().copyWith(hintText: 'Product Price'),
          ),
          FlatButton(
              color: Colors.orange,
              onPressed: () async {
                final ProductModel product = ProductModel(
                    productName: productName, productPrice: productPrice);

                await DatabaseService().insertData(product.toMap());

                setState(() {
                  productpriceController.clear();
                  productnameController.clear();
                });
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
