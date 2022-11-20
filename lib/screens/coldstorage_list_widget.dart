import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:csim/screens/coldstorage_inventory_list.dart';

List<ColdStorage> allColdStorages(String str) {
  final jsonData = json.decode(str);
  return new List<ColdStorage>.from(jsonData.map((x) => ColdStorage.fromJson(x)));
}

Future<List<ColdStorage>> fetchColdStorages() async {
  final url = Uri.parse(_localhost());
  http.Response response = await http.get(url.replace(path: 'fetchcoldstorages'));
  print(response.body);
  print(response.statusCode);
  print(response.toString());
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return allColdStorages(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

String _localhost() {
  if (Platform.isAndroid)
    return 'http://10.0.2.2:3000';
  else // for iOS simulator
    return 'http://localhost:3000';
}

class ColdStorage {
  final String storageName;
  final String storageId;
  final String ownerName;
  final String ownerContact;
  final String ownerMail;

  const ColdStorage({
    required this.storageName,
    required this.storageId,
    required this.ownerName,
    required this.ownerMail,
    required this.ownerContact,
  });

  factory ColdStorage.fromJson(Map<String, dynamic> json) {
    return ColdStorage(
      storageName: json['storagename'],
      storageId: json['storageid'],
      ownerName: json['ownername'],
      ownerMail: json['email'],
      ownerContact: json['ownercontact'],
    );
  }
}

// void main() => runApp(const ColdStorageListWidget());

class ColdStorageListWidget extends StatefulWidget {
  const ColdStorageListWidget({super.key});

  @override
  State<ColdStorageListWidget> createState() => _ColdStorageListWidgetState();
}

class _ColdStorageListWidgetState extends State<ColdStorageListWidget> {
  late Future<ColdStorage> futureAlbum;
  List<ColdStorage> _coldStorages = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async{
    List<ColdStorage> coldstorages = await fetchColdStorages();
    setState(() => _coldStorages = coldstorages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        itemCount: _coldStorages.length,
        itemBuilder: (BuildContext ctxt, int i) {
          return new Card(
            child: Column(
              children: [
                Text(_coldStorages[i].storageName),
                Text(_coldStorages[i].storageId),
                Text(_coldStorages[i].ownerName),
                Text(_coldStorages[i].ownerMail),
                Text(_coldStorages[i].ownerContact),
                    TextButton(
                      child: const Text(
                        'know more>',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ColdStorageInventoryListWidget()),
                        );
                      },
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}