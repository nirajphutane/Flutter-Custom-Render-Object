
import 'package:custom_render_object/CustomRenderObjects/LeafRenderObjectWidget/SpaceHolder/SpaceHolder.dart';
import 'package:custom_render_object/CustomRenderObjects/MultiChildRenderObjectWidget/Layout/Layout.dart';
import 'package:flutter/material.dart';

class Layouts extends StatefulWidget {
  const Layouts({super.key});

  @override
  State<Layouts> createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {

  Orientations orientation = Orientations.vertical;

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Layout: ${orientation.name}')
    ),
    body: Center(
      child: Layout(
        orientation: orientation,
        children: const [
          SpaceHolder(
              size: Size(150, 150),
              color: Colors.green
          ),
          SpaceHolder(
              size: Size(100, 100),
              color: Colors.blue
          ),
          SpaceHolder(
              size: Size(50, 50),
              color: Colors.red
          )
        ]
      )
    ),
    floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.screen_rotation_alt_rounded),
        onPressed: () {
          setState(() {
            orientation = Orientations.values[(orientation.index + 1) % Orientations.values.length];
          });
        }
    )
  );
}
