//import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class DetailsPage extends StatelessWidget {
  final Contact contact;

  DetailsPage({
    Key? key,
    required this.contact,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            if (contact.photo != null)
              Image(
                image: MemoryImage(contact.photo!),
              )
            else
            CircleAvatar(backgroundColor: Colors.green,
            radius: 100,
            child: Text(
              contact.name.first[0].toUpperCase(),
              style: TextStyle(fontSize: 200),),),
              //const Image(image: AssetImage("images/contact.png")),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                if (contact.name != null)
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                Text(
                  contact.name.first,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                if (contact.phones != null)
                  const CircleAvatar(
                    child: Icon(Icons.phone),
                  ),
                Text(
                  contact.phones.first.number,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
