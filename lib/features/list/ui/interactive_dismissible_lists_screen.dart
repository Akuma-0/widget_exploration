import 'package:flutter/material.dart';
import 'package:widget_exploration/features/list/ui/widgets/list_item.dart';

class InteractiveDismissibleListsScreen extends StatefulWidget {
  const InteractiveDismissibleListsScreen({super.key});

  @override
  State<InteractiveDismissibleListsScreen> createState() =>
      _InteractiveDismissibleListsScreenState();
}

class _InteractiveDismissibleListsScreenState
    extends State<InteractiveDismissibleListsScreen> {
  List<Map<String, dynamic>> items = [
    {'id': '1', 'title': 'First Item'},
    {'id': '2', 'title': 'Second Item'},
    {'id': '3', 'title': 'Third Item'},
  ];
  void _removeItem(String id) {
    final itemIndex = items.indexWhere((item) => item['id'] == id);
    if (itemIndex == -1) return;
    final removedItem = items[itemIndex];
    setState(() {
      items.removeAt(itemIndex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${removedItem['title']} dismissed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              items.insert(itemIndex, removedItem);
            });
          },
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dismissible Lists')),
      body: SafeArea(
        child: ReorderableListView(
          children: items.map((item) {
            return ListItem(
              key: ValueKey(item['id']),
              id: item['id'],
              title: item['title'],
              onDismissed: () => _removeItem(item['id']),
            );
          }).toList(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
