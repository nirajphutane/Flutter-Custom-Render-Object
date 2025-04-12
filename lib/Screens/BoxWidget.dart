
import 'package:custom_render_object/CustomRenderObjects/SingleChildRenderObjectWidget/Box.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatefulWidget {
  const BoxWidget({super.key});

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Boxes')
      ),
      body: const Center(
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            decoration: BoxDecoration(color: Colors.red),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: Colors.green),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.yellow),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Box(
                              decoration: BoxDecoration(color: Colors.redAccent),
                              child: Text('Box')
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Box(
                              decoration: BoxDecoration(color: Colors.greenAccent),
                              child: Text('Box')
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Box(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: Colors.yellowAccent),
                                child: Text('Box')
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.lightGreen),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.only(left: 25),
                            decoration: BoxDecoration(color: Colors.lime),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.only(left: 25),
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            width: 100,
                            height: 80,
                            padding: EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 30),
                            decoration: BoxDecoration(color: Colors.orangeAccent),
                            child: Text('Box')
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Box(
                            width: 100,
                            height: 80,
                            padding: EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 30),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(color: Colors.deepOrange),
                            child: Text('Box')
                        )
                    )
                  ]
              )
          )
      )
  );
}
