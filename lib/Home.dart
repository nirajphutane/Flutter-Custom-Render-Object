
import 'package:flutter/material.dart';
import 'Screens/BoxWidget.dart';
import 'Screens/SpaceHolderWidget.dart';
import 'Screens/Layouts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home')
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SpaceHolderWidget()));
                    },
                    child: const Text('SpaceHolder')
                )
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BoxWidget()));
                    },
                    child: const Text('Box')
                )
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Layouts()));
                    },
                    child: const Text('Layout')
                )
              )
            ]
          )
        )
      )
  );
}
