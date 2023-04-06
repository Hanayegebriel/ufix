import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ufixfinal/mappage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController name = TextEditingController();
  TextEditingController adress = TextEditingController();
  //TextEditingController age = TextEditingController();

  void addUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // Call the user's CollectionReference to add a new user
        FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'full_name': name.text, // John Doe
          'company': adress.text, // Stokes and Sons
          //'age': age.text // 42
        }).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Indicate Your Alert!',
                style: TextStyle(
                  fontSize: 30,
                ),

                //style: Theme.of(context).textTheme.headline1,
              ),
            ),
          TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: adress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Address',
              ),
            ),
            // TextField(
            //   controller: disconnection,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: '',
            //   ),
            // ),
            TextButton(
                onPressed: addUser,
                child: Text("Click this button and choose outage type below")
            ),

            item("Water Outage", "assets/water.png", () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage() ))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:Text(""),
            ),

            item("Power Outage", "assets/power.png", () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage() ))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:Text(""),

           ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child:Text(""),
        ),
          ],
        ),
      )
    );
  }

  Widget item(String name, String image, void Function() f) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                color: Colors.grey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))
            ),
            height: 100.0,
            width: MediaQuery.of(context).size.width*0.6,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            onPressed: f,
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
