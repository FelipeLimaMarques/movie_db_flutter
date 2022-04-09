import 'package:flutter/material.dart';
import 'package:movie_db_flutter/secrets.dart';
import 'package:dio/dio.dart';
import 'package:movie_db_flutter/services/client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieDB',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  late RestClient client;
  HomeScreen({Key? key}) : super(key: key) {
    final dio = Dio();
    dio.options.headers['Authorization'] = Secrets.bearerToken;
    dio.options.headers['Content-Type'] = 'application/json;charset=utf-8';
    client = RestClient(dio);
  }

  log() async {
    final movies = await client.getMovies(Secrets.apiKey);
    print(movies.movies[0].id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MovieDB')),
        body: Center(
            child: ElevatedButton(
                onPressed: log, child: const Text('Get Movie List'))));
  }
}
