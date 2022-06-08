import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phonecontacts/detailsPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact List",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ContactsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact>? contacts;
  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Phone Contacts List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: (contacts) == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (BuildContext context, int index) {
                Uint8List? image = contacts![index].photo;
                String num = (contacts![index].phones.isNotEmpty)
                    ? (contacts![index].phones.first.number)
                    : "--";
                return ListTile(
                  leading: (image == null)
                      ? CircleAvatar(
                        backgroundColor: Colors.green,
                                    child: Text(contacts![index].name.first[0].toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30), ),

                        //  child: Icon(Icons.person),
                        )
                      : CircleAvatar(
                          backgroundImage: MemoryImage(image),
                        ),
                  title: Text(contacts![index].name.first),
                  subtitle: Text(num),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                contact: contacts![index],
                              )),
                    );
                  },
                );
              }),
    );
  }
}
