import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const CustomAppBarIcon({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.sp,
        width: 45.sp,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0.sp),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: Icon(icon, size: 28.sp),
      ),
    );
  }
}
