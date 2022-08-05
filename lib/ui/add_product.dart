import 'package:flutter/material.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'nav/main_nav.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Position',
                hintText: 'Position',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height',
                hintText: 'Height',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'School',
                hintText: 'School',
              ),
            ),
            const SizedBox(height: 32),
            ArgonButton(
              height: 50,
              width: 200,
              borderRadius: 5.0,
              color: Colors.deepOrange,
              loader: Container(
                padding: const EdgeInsets.all(10),
              ),
              onTap: (startLoading, stopLoading, btnState) {
                // FirebaseFirestore.instance.collection("products").add(
                //     {
                //       "name" : "peter",
                //       "height" : "0",
                //       "position" : "0",
                //       "type" : "0",
                //       "image" : "0",
                //     }).then((value){
                // });
                //  FirebaseFirestore.instance.collection("products").doc("RctLPrdnJlfSPvtMDj4v").delete();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainNav(),
                        maintainState: true),
                    (Route<dynamic> route) => false);
              },
              child: const Text(
                "Add",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
