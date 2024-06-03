import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guessing_game/ui/home_screen/home_screen.dart';
import 'package:guessing_game/utils/app_colors.dart';
import 'package:guessing_game/widgets/my_custom_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.blackColor ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0).copyWith(top: context.height*0.025),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Guessing Game',
                    style: GoogleFonts.poppins().copyWith(color: AppColors.whiteColor,fontSize: 32),)),
            
                SizedBox(height:context.height*0.01),
            
                Image.asset('assets/images/robot.png',height: context.width*0.8,width: context.width*0.8,),
            
                SizedBox(height:context.height*0.01),
            
                Text('"Welcome to GuessMaster, the ultimate guessing game that will challenge your intuition and sharpen your mind.'
                    ' Are you ready to embark on a journey full of surprises and fun?"',
                  style: GoogleFonts.poppins().copyWith(color: AppColors.whiteColor,fontSize: 14),),
            
                SizedBox(height:context.height*0.15),
            
                MyCustomButton(
                  onPress: (){
                    Get.to(
                          () => const HomeScreen(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 400),
                    );
                  },
                  title: 'Play Game',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
