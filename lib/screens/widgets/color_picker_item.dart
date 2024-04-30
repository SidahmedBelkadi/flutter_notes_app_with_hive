import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        height: 38.h,
        width: 38.w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 3.w) : null,
        ),
      ),
    );
  }
}
