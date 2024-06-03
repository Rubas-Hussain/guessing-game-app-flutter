import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guessing_game/ui/home_screen/home_controller.dart';
import 'package:guessing_game/utils/app_colors.dart';
import 'package:guessing_game/widgets/MyCustomButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding:
              const EdgeInsets.all(18.0).copyWith(top: context.width * 0.2),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: context.width * 0.38,
                  child: MyCustomButton(
                    onPress: () {},
                    title: 'Try Again!',
                  ),
                ),
              ),
              SizedBox(
                height: context.height*0.3,
              ),
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: context.width,
                  ),
                  Positioned(
                    top: 47,
                    child: Container(
                      height: 5,
                      width: context.width,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Positioned(
                    right: 110,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                          child: Text('?',style: GoogleFonts.poppins().copyWith(fontSize: 62),)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height*0.2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: context.width * 0.38,
                  child: MyCustomButton(
                    onPress: () {},
                    title: 'Play',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// ConfettiWidget(
// confettiController: controller.confettiController,
// blastDirection: 3 * pi/2,
// blastDirectionality: BlastDirectionality.directional,
// colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow],
// ),
