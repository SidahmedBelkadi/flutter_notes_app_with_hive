import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  const CustomAppBarIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: 28),
    );
  }
}
