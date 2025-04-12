
import 'package:custom_render_object/CustomRenderObjects/LeafRenderObjectWidget/SpaceHolder/SpaceHolder.dart';
import 'package:flutter/material.dart';

class SpaceHolderWidget extends StatefulWidget {
  const SpaceHolderWidget({super.key});

  @override
  State<SpaceHolderWidget> createState() => _SpaceHolderWidgetState();
}

class _SpaceHolderWidgetState extends State<SpaceHolderWidget> {

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('SpaceHolder')
      ),
      body: const Center(
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 100,
                            height: 200,
                            child: SpaceHolder(
                              color: Colors.red,
                              strokeColor: Colors.white
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SpaceHolder(
                          size: Size(200, 100),
                          color: Colors.green,
                          strokeColor: Colors.white
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: SpaceHolder(
                              size: Size(200, 200),
                              color: Colors.blue,
                              strokeColor: Colors.white
                            )
                        )
                    ),

                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 200,
                            height: 200,
                            child: SpaceHolder(
                              size: Size(100, 100),
                              color: Colors.yellow,
                              strokeColor: Colors.white
                            )
                        )
                    )
                  ]
              )
          )
      )
  );
}
