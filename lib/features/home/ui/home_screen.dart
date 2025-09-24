import 'package:flutter/material.dart';
import 'package:widget_exploration/features/list/ui/interactive_dismissible_lists_screen.dart';
import 'package:widget_exploration/features/loading/ui/advanced_animation_chain_screen.dart';
import 'package:widget_exploration/features/physics/ui/interactive_hysics_widget_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return InteractiveDismissibleListsScreen();
                    },
                  ),
                );
              },
              child: Text('Interactive Dismissible Lists'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return InteractivePhysicsWidgetScreen();
                    },
                  ),
                );
              },
              child: Text('Interactive Physics Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AdvancedAnimationChainScreen();
                    },
                  ),
                );
              },
              child: Text('Advanced Animation Chain'),
            ),
          ],
        ),
      ),
    );
  }
}
