import 'package:flutter/material.dart';

Widget _buildSectionHeader(String title) {
  return Row(
    children: [
      const Expanded(
        child: Divider(thickness: 1.5, color: Colors.grey),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
      const Expanded(
        child: Divider(thickness: 1.5, color: Colors.grey),
      ),
    ],
  );
}
