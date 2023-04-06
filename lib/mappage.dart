import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ufixfinal/mappage.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Map page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              item("Button 1", "assets/maps.jpg", () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MapPage()))),

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
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              'Alert Indicated',
              style: TextStyle(
                fontSize: 40,
              ),

              //style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                color: Colors.grey,
                //borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))
            ),
            height: 600.0,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //       textStyle: const TextStyle(fontSize: 20)),
          //   onPressed: f,
          //   child: Text(name),
          // ),

    ],
      ),
    );
  }
}