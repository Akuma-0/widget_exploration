import 'package:flutter/material.dart';
import 'package:widget_exploration/features/physics/ui/widgets/ball.dart';

class InteractivePhysicsWidgetScreen extends StatefulWidget {
  const InteractivePhysicsWidgetScreen({super.key});

  @override
  State<InteractivePhysicsWidgetScreen> createState() =>
      _InteractivePhysicsWidgetScreenState();
}

bool isRedAccepted = false;
bool isAmberAccepted = false;
bool isGreenAccepted = false;

class _InteractivePhysicsWidgetScreenState
    extends State<InteractivePhysicsWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Ball(data: 'red', color: Colors.red),
                  Ball(data: 'amber', color: Colors.amber),
                  Ball(data: 'green', color: Colors.green),
                ],
              ),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DragTarget<String>(
                    builder: (context, data, rejected) {
                      return Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: isRedAccepted ? Colors.red : Colors.red[300],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red, width: 3),
                        ),
                        child: isRedAccepted
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              )
                            : null,
                      );
                    },
                    onWillAcceptWithDetails: (details) {
                      setState(() {
                        isRedAccepted = (details.data == 'red');
                      });
                      return details.data == 'red';
                    },
                  ),
                  DragTarget<String>(
                    builder: (context, data, rejected) {
                      return Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: isAmberAccepted
                              ? Colors.amber
                              : Colors.amber[300],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber, width: 3),
                        ),
                        child: isAmberAccepted
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              )
                            : null,
                      );
                    },
                    onWillAcceptWithDetails: (details) {
                      setState(() {
                        isAmberAccepted = (details.data == 'amber');
                      });
                      return details.data == 'amber';
                    },
                  ),
                  DragTarget<String>(
                    builder: (context, data, rejected) {
                      return Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: isGreenAccepted
                              ? Colors.green
                              : Colors.green[300],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green, width: 3),
                        ),
                        child: isGreenAccepted
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              )
                            : null,
                      );
                    },
                    onWillAcceptWithDetails: (details) {
                      setState(() {
                        isGreenAccepted = (details.data == 'green');
                      });
                      return details.data == 'green';
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
