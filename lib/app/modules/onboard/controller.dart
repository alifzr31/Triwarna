import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController(initialPage: 0).obs;

  final images = [
    'onboard1.svg',
    'onboard2.svg',
    'onboard3.svg',
  ].obs;

  final title = [
    'Beragam produk dan peralatan cat berbagai pilihan warna',
    'Membership Gratis',
    'Pencarian Toko yang Mudah',
  ].obs;

  final desc = [
    'Aplikasikan warna cat rumah anda dengan produk kami',
    'Mulai dari Silver, Gold, dan Platinum. Kamu bisa menukarkan point dengan hadiah menarik',
    'Temukan toko triwarna terdekat dari lokasi anda',
  ].obs;

  void nextPage() {
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void skip() {
    pageController.value.animateToPage(
      title.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void back() {
    pageController.value.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void getStarted() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('opened', true);
    Get.offAllNamed('/dashboard');
  }
}
