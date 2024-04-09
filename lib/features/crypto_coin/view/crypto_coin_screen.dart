import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String name = 'No name Coin :(';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, "Provide argument of type String!");
    name = args as String;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(name, style: const TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
          
        ),
        body: const Center(
          child: Text("name", style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        ),
        floatingActionButton: FilledButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Go Back'),
        ),
      )
    );
  }
}