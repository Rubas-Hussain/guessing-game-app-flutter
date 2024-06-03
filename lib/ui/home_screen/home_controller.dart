import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ConfettiController confettiController;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(duration: const Duration(seconds: 1));
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
