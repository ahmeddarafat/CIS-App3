import 'package:cis_app3/resources/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class PublicButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double width;
  final double borderRadius;

  const PublicButton({
    Key? key,
    this.text = "",
    required this.onPressed,
    this.width = double.infinity,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: AppText(
            text: text,
            color: AppColors.white,
            fz: 18.sp,
            fw: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
