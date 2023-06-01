import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    key,
    this.icon,
    this.label,
    this.onDeleted,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final Function(String) onDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 25,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 18),
          Expanded(child: Text(label)),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onDeleted(label),
          ),
        ],
      ),
    );
  }
}
