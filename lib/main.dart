import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/':(context) => const MyApp(),
    '/coin':(context) => const SecondRoute()
  },
  theme: ThemeData(
    textTheme:const TextTheme(
      labelLarge: TextStyle(
        fontFamily: "Courier new", fontSize: 24,
        fontWeight: FontWeight.bold, color: Colors.white),
      labelSmall: TextStyle(
        fontFamily: "Courier new", fontSize: 24,
        fontWeight: FontWeight.bold, color: Colors.white
      )
    ),
  )
));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<String> names = ['Bitcoin', 'PEPE'];

  void _buttonPressed() {
    setState(() => 
      names.add('New Name')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MY FIRST APP', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.black,
      ),
      body: ListView.separated(
        itemCount: names.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) => ListTile(
        title: Text(names[i], style: Theme.of(context).textTheme.labelLarge),
        subtitle: Text("Subtitle", style: Theme.of(context).textTheme.labelSmall),
        onTap: () => (
          Navigator.pushNamed(context, '/coin', arguments: names[i])
        ),
        leading: SvgPicture.asset(
          'assets/bitcoin_logo.svg',
          width: 30,
          height: 30,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      )),
      backgroundColor: Colors.black,
      floatingActionButton: FilledButton(
        onPressed: _buttonPressed,  
        child: const Text('Press me'),
      ),
    );
  }
}

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
          title: Text(name, style: TextStyle(color: Colors.white)),
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