import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);
  static const String routeName = '/Example';

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, snapshot) {
              return Transform.rotate(
                angle: 0.785 * animation.value,
                child: Container(
                  height: 100 + (100 * animation.value),
                  width: 100 + (100 * animation.value),
                  color: Colors.red.withOpacity(animation.value),
                  child: Text(animation.value.toString()),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
      ),
    );
  }
}
