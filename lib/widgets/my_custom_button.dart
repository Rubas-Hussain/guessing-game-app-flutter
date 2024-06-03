import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guessing_game/utils/app_colors.dart';

class MyCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const MyCustomButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width*0.8,
      height: context.height*0.06,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.whiteColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.width*0.02)
          )),
          elevation: MaterialStateProperty.all(4),
          shadowColor: MaterialStateProperty.all(AppColors.whiteColor),
          // splashFactory: NoSplash.splashFactory

        ),
        child: Text(title,
          style: GoogleFonts.poppins().copyWith(
              color: AppColors.blackColor,fontSize: 15,fontWeight: FontWeight.w500,letterSpacing: 1),),
      ),
    );
  }
}
