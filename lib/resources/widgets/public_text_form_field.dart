import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class PublicTextFormField extends StatefulWidget {
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool isPassword;
  final bool showprefixIcon;
  final bool showSuffixIcon;
  final int? maxlenght;
  final Function()? ontap;
  final Function()? ontapPrefixIcon;
  final Function()? ontapSuffixIcon;
  final double borderRadius; 
  final Color borderColor;
  final EdgeInsetsGeometry? contentPadding;

  const PublicTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.showSuffixIcon = false,
    this.showprefixIcon = false,
    this.ontap,
    this.keyboardtype = TextInputType.text,
    this.maxlenght,
    this.prefixIcon = Icons.person,
    this.suffixIcon = Icons.person,
    this.ontapPrefixIcon,
    this.ontapSuffixIcon,
    this.borderRadius= 24.0,
    this.borderColor= AppColors.grey,
    this.contentPadding 
  }) : super(key: key);

  @override
  State<PublicTextFormField> createState() => _PublicTextFormFieldState();
}

class _PublicTextFormFieldState extends State<PublicTextFormField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    debugPrint('the widget text field is rebuilt');
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      maxLines: 1,
      maxLength: widget.maxlenght,
      obscureText: widget.isPassword ? showPassword : false,
      keyboardType: widget.keyboardtype,
      controller: widget.controller,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        fillColor: Colors.white,
        // iconColor: AppColors.orange,
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:  BorderSide(color: widget.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:  BorderSide(color: widget.borderColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:  BorderSide(color: widget.borderColor, width: 1),
        ),
        contentPadding: widget.contentPadding?? EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        prefixIcon: widget.showprefixIcon
            ? Icon(
                widget.prefixIcon,
                size: 22,
                color: AppColors.grey,
              )
            : null,
        suffixIcon: getSuffixIcon(),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
    );
  }

  Widget? getSuffixIcon() {
    if (widget.showSuffixIcon) {
      if (!widget.isPassword) {
        return Icon(
          widget.suffixIcon,
          size: 22,
          color: AppColors.grey,
        );
      }
      return InkWell(
          onTap: (() {
            setState(() {
              showPassword = !showPassword;
            });
          }),
          child: !showPassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off));
    }
    return null;
  }
}
