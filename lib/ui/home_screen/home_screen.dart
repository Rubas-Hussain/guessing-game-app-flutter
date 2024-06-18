import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guessing_game/ui/home_screen/home_controller.dart';
import 'package:guessing_game/utils/app_colors.dart';
import 'package:guessing_game/widgets/my_custom_button.dart';
import 'package:guessing_game/widgets/my_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 18.0),
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.back,
                  size: 24,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: context.width * 0.38,
                  child: MyCustomButton(
                    onPress: () {
                      if (controller.randomInt.value != 0) {
                        controller.generateRandomInt();
                        controller.isCorrect.value=false;
                        controller.newTry.value=true;
                        print(controller.randomInt.value);
                      }
                    },
                    title: 'Try Again!',
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.08),
              Obx(() => Text(
                  controller.randomInt.value == 0
                      ? 'Generate Number...'
                      : 'Number generated ...',
                  style: GoogleFonts.poppins().copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                  ))),
              SizedBox(height: context.height * 0.05),
              Stack(
                children: [
                  SizedBox(
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Obx(() => Text(
                              controller.isCorrect.value==true
                                  ? controller.randomInt.value.toString()
                                  : '?',
                              style:
                                  GoogleFonts.poppins().copyWith(fontSize: 62),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.width * 0.38,
                    child: Obx(() => MyCustomButton(
                          onPress: () {
                            if (controller.randomInt.value == 0) {
                              controller.generateRandomInt();
                              controller.newTry.value=true;
                            } else {
                              controller.checkGuess();
                              if(controller.randomInt.value.toString()==controller.textFieldController.text){
                                controller.isCorrect.value=false;
                                controller.newTry.value=false;
                              }
                            }
                            if (kDebugMode) {
                              print(controller.randomInt.value);
                            }
                          },
                          title: controller.randomInt.value == 0
                              ? 'Play'
                              : 'Check',
                        )),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 68,
                          width: 135,
                          child: MyTextField(
                            controller: controller.textFieldController,
                          )),
                      const SizedBox(height: 10),
                      Obx(() => controller.isCorrect.value == true  && controller.randomInt.value!=0
                          ? Text(
                        'Congratulations...',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      )
                          :
                      controller.isCorrect.value==false && controller.newTry.value == false
                        ?
                      Text(
                        "You're  wrong...",
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                        softWrap: true,
                      )
                          :
                      // controller.isCorrect.value==false ?
                      //     const SizedBox.shrink():
                          const SizedBox.shrink()
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
