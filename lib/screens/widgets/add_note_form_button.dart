import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app_hive_db/core/constants/app_colors.dart';

class CustomAddNoteFormElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const CustomAddNoteFormElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0.sp),
          ),
        ),
        child: child,
      ),
    );
  }
}
