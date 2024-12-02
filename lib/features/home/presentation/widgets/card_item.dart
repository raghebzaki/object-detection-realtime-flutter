import 'package:flutter/material.dart';
class CardItem extends StatelessWidget {
  final BuildContext context;
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const CardItem({super.key, required this.context, required this.title, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
