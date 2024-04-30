import 'package:flutter/material.dart';

class ColorPickerItem extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final void Function()? onTap;
  const ColorPickerItem({
    super.key,
    required this.isSelected,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color: color,
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
