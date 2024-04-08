// import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(names: ['Tima', 'Bina'],),
  theme: ThemeData(
    textTheme: TextTheme(
      labelLarge: const TextStyle(
        fontFamily: "Courier new", fontSize: 24,
        fontWeight: FontWeight.bold, color: Colors.white)
    )
  )
));

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('MY FIRST APP', style: TextStyle(
//           color: Colors.white
//         ),),
//         backgroundColor: Colors.black,
//       ),
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, i) => ListTile(
//         title: Text('Hello', style: Theme.of(context).textTheme.labelLarge),
//         subtitle: Text("Subtitle"),
//         onTap: () => (print('tapped on index $i')),
//       )),
//       backgroundColor: Colors.black,
//     );
//   }
// }

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.names});

  List<String> names;
  
  @override
  _MyAppState createState() {
    return _MyAppState(names);
  }
}

class _MyAppState extends State<MyApp> {
  _MyAppState(List<String> names) :
    this.names = names;

  List<String> names;

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
        separatorBuilder: (context, index) => Divider(color: Colors.white),
        itemBuilder: (context, i) => ListTile(
        title: Text(names[i], style: Theme.of(context).textTheme.labelLarge),
        subtitle: Text("Subtitle"),
        onTap: () => (
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute(name: names[i])))
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      )),
      backgroundColor: Colors.black,
      floatingActionButton: FilledButton(
        onPressed: _buttonPressed,  
        child: const Text('Press me'),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text("New Screen", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
          
        ),
        body: Center(
          child: Text(name, style: TextStyle(
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