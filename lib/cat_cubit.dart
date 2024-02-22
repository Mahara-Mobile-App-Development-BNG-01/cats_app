import 'dart:convert';

import 'package:cats_app/cat_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cat.dart';

class CatsCubit extends Cubit<AsyncCatState> {
  CatsCubit() : super(AsyncCatStateLoading()) {
    fetchData();
  }

  void fetchData() async {
    final cats = await _fetchData();
    emit(AsyncCatStateLoaded(cats));
  }
}

Future<List<Cat>> _fetchData() async {
  final response = await http
      .get(Uri.parse('https://api.api-ninjas.com/v1/cats?name=n'), headers: {
    'X-Api-Key': '7pzGtf21ejiKm30iiH6o3A==An2PCjx7cdfX8hSQ',
  });

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
