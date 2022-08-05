import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halls/ui/add_product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double _sizeCards = 210;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ohm Collections",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            TextField(
                decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none),
              hintText: "หาอะไรอยู่หรอ??",
              prefixIcon: const Icon(Icons.search),
            )),
            const SizedBox(height: 16),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Karasuno',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'more ',
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                      height: _sizeCards,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .where('type', isEqualTo: 'Karasuno')
                            .limit(10)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data!.docs[index];
                                  return containerCard(documentSnapshot);
                                });
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Nekoma',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'more ',
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                      height: _sizeCards,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .where('type', isEqualTo: 'Nekoma')
                            .limit(10)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data!.docs[index];
                                  return containerCard(documentSnapshot);
                                });
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Aoba Johsai',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'more ',
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                      height: _sizeCards,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .where('type', isEqualTo: 'Aoba Johsai')
                            .limit(10)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data!.docs[index];
                                  return containerCard(documentSnapshot);
                                });
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )),
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProduct()),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
      ),
    );
  }

  Card buildCard(DocumentSnapshot<Object?> documentSnapshot) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: ListTile(
        title: Text(documentSnapshot['name']),
        subtitle: Text(documentSnapshot['price']),
      ),
    );
  }

  Container containerCard(DocumentSnapshot snapshot) {
    return Container(
        margin: const EdgeInsets.all(0),
        width: 180,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                snapshot['image'],
                fit: BoxFit.fill,
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
                    child: Text(
                      snapshot['height'],
                      style:
                          const TextStyle(color: Colors.black38, fontSize: 10),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  snapshot['name'],
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.deepOrange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                child: Row(
                  children: [
                    const SizedBox(height: 8),
                    const Text("Teams "),
                    Text(
                      snapshot['type'],
                      style: const TextStyle(color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.start,
                    snapshot['position'] as String,
                    style: const TextStyle(color: Colors.black38, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
