import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:altdict/models/result_manager.dart';
import 'package:altdict/ui/home.dart';

void main() => runApp(const AltDict());

class AltDict extends StatelessWidget {
  const AltDict({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: 'AltDict',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ResultManager(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
