import 'dart:math';


import 'package:flutter/material.dart';
import 'package:random/shape.dart';
import 'package:random/shape_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Random Shapes')),
        body: Center(child: RandomShapeScreen()),
      ),
    );
  }
}
class RandomShapeScreen extends StatefulWidget {
  @override
  _RandomShapeScreenState createState() => _RandomShapeScreenState();
}

class _RandomShapeScreenState extends State<RandomShapeScreen> {
  Shape randomShape = Shape.square;


  void generateRandomShape() {
    final random = Random();
    const values = Shape.values;
    final randomIndex = random.nextInt(values.length);
    setState(() {
      randomShape = values[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

          child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const SizedBox(height: 20),
              ShapeWidget(shape: randomShape),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: generateRandomShape,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );




  }
}



