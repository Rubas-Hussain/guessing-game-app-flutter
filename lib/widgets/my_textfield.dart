import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  const MyTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      maxLength: 2,
      style: const TextStyle(color: AppColors.whiteColor),
      controller: controller,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 0, left: 7,),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
