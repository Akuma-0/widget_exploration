import 'package:flutter/material.dart';

class AdvancedAnimationChainScreen extends StatefulWidget {
  const AdvancedAnimationChainScreen({super.key});

  @override
  State<AdvancedAnimationChainScreen> createState() =>
      _AdvancedAnimationChainScreenState();
}

class _AdvancedAnimationChainScreenState
    extends State<AdvancedAnimationChainScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final List<Animation<double>> containerAnimations;

  final int numberOfContainers = 3;
  final double baseSize = 10.0;
  final double maxSize = 20.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (numberOfContainers * 400)),
    )..repeat();

    // Create staggered animations for each container
    containerAnimations = List.generate(numberOfContainers, (index) {
      final double start = index / numberOfContainers;
      final double end =
          (index / numberOfContainers) + (1 / numberOfContainers);
      return Tween<double>(begin: baseSize, end: maxSize).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(start, end, curve: Curves.linear),
        ),
      );
    });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(numberOfContainers, (index) {
            return AnimatedBuilder(
              animation: containerAnimations[index],
              builder: (context, child) {
                return Container(
                  width: containerAnimations[index].value,
                  height: containerAnimations[index].value,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
