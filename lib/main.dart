import 'dart:convert';

import 'package:cats_app/cat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

Future<List<Cat>> fetchData() async {
  final response = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/cats?name=n'),
      headers: {'X-Api-Key': '7pzGtf21ejiKm30iiH6o3A==An2PCjx7cdfX8hSQ'});

  final responseList = jsonDecode(response.body) as List<dynamic>;
  final listOfCats = responseList
      .map(
        (e) => Cat.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList();

  return listOfCats;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cats'),
        ),
        body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...snapshot.data!.map(
                        (cat) => ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CatDetails(
                                  cat: cat,
                                ),
                              ),
                            );
                          },
                          leading: Image.network(
                            cat.imageLink,
                            width: 65,
                            height: 65,
                            fit: BoxFit.fill,
                          ),
                          title: Text(cat.name),
                          subtitle: Text(cat.origin),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

class CatDetails extends StatelessWidget {
  const CatDetails({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            cat.imageLink,
            height: 250,
          ),
          Text('Length: ${cat.length}')
        ],
      ),
    );
  }
}
