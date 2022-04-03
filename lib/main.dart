import 'package:flutter/material.dart';
import 'package:movie_db_flutter/services/list_service.dart';

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
  final ListService listService = ListService();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MovieDB')),
        body: Center(
            child: ElevatedButton(
                onPressed: listService.getMovieList,
                child: const Text('Get Movie List'))));
  }
}
