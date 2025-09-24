import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String title;
  final VoidCallback? onDismissed;
  final String id;

  const ListItem({
    super.key,
    required this.title,
    required this.id,
    this.onDismissed,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        widget.onDismissed?.call();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.drag_handle),
              Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Icon(
                  isChecked
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
