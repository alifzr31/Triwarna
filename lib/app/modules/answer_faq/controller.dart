import 'package:get/get.dart';

class AnswerFaqController extends GetxController {
  final chooseQuestion = Rx<String?>(null);
  final questionTrigger = Rx<int?>(null);

  final failLogin = [
    'Pastikan email, username dan password nya sesuai dengan yang di daftarkan.',
    'Apabila anda lupa kata sandi silahkan masuk ke halaman lupa password.',
    'Apabila kendala tersebut tidak bisa diselsaikan silahkan menghubungi toko triwarna terdekat.',
  ].obs;

  final failRedeem = [
    'Pastikan anda mempunyai point.',
    'Pastikan versi dari aplikasi member Triwarna itu adalah versi terbaru silahkan cek di play store atau appstore.',
    'Pastikan anda berada didalam jangkauan koneksi yang baik.',
    'Apabila kendala tersebut tidak bisa diselesaikan silahkan menghubungi toko triwarna terdekat.',
  ].obs;

  @override
  void onInit() {
    chooseQuestion.value = Get.arguments['question'];
    questionTrigger.value = Get.arguments['questionTrigger'];
    super.onInit();
  }
}
