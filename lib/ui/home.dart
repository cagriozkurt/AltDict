import 'package:flutter/material.dart';
import 'search_bar.dart';
import 'package:altdict/ui/result_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AltDict'),
      ),
      body: Column(
        children: const <Widget>[
          SearchBar(),
          Expanded(
            child: ResultList(),
          ),
        ],
      ),
    );
  }
}
