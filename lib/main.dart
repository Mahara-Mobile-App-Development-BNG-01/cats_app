import 'dart:convert';

import 'package:cats_app/cat.dart';
import 'package:cats_app/cat_cubit.dart';
import 'package:cats_app/cat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(BlocProvider(create: (_) => CatsCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cats'),
        ),
        body: Builder(builder: (context) {
          final cubit = context.watch<CatsCubit>();
          final state = cubit.state;

          return switch (state) {
            AsyncCatStateLoading() => const CircularProgressIndicator(),
            AsyncCatStateLoaded() => CatsList(cats: state.data),
            AsyncCatStateError() => Text(state.error.toString()),
          };

        }),
      ),
    );
  }
}

class CatsList extends StatelessWidget {
  final List<Cat> cats;

  const CatsList({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cats.map(
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
