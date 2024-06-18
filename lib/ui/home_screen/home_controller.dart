import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController textFieldController = TextEditingController();

  // Generating random Int
  RxInt randomInt = 0.obs;
  Rx<bool> newTry=true.obs;
  RxBool isCorrect=false.obs;

  generateRandomInt() {
    // final int newNumber;
    return randomInt.value = Random().nextInt(20) + 1;
  }

  void checkGuess() {
    textFieldController.text == randomInt.value.toString() ;
    if(textFieldController.text == randomInt.value.toString()){
    print("${newTry.value} ======> new try ");
      textFieldController.clear();
      isCorrect.value=true;
      newTry.value=false;
    }else{
      isCorrect.value=false;
      newTry.value=false;
    }
  }


  late ConfettiController confettiController;

  @override
  void onInit() {
    super.onInit();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }

  void callConfetti() {
    confettiController.play();
  }
}
