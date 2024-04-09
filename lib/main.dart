import 'package:flutter/material.dart';
import 'features/crypto_list/crypto_list.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/':(context) => const CryptoListScreen(),
    '/coin':(context) => const SecondRoute()
  },
  theme: ThemeData(
    textTheme:const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white
      ),
      labelLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold, color: Colors.white),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold, color: Colors.white
      )
    ),
    scaffoldBackgroundColor: Colors.black54,
    dividerColor: Colors.white24,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black54)
  )
));



class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
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