import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/content.dart';
import 'package:triwarna_rebuild/app/data/providers/contents_provider.dart';

class ContentsController extends GetxController {
  final ContentsProvider contentsProvider;

  ContentsController({required this.contentsProvider});

  final currentTab = 0.obs;

  final event = <Content>[].obs;
  final promo = <Content>[].obs;
  final eventLoading = true.obs;
  final promoLoading = true.obs;

  final title = Rx<String?>(null);
  final slug = Rx<String?>(null);
  final date = Rx<String?>(null);
  final detailContent = Rx<Content?>(null);
  final detailContentLoading = false.obs;

  @override
  void onInit() {
    fetchEvent();
    fetchPromo();
    super.onInit();
  }

  @override
  void onClose() {
    event.clear();
    promo.clear();
    super.onClose();
  }

  Future<void> fetchEvent() async {
    try {
      final response = await contentsProvider.fetchContents();

      if (response.statusCode == 200) {
        final List<Content> body = response.data['data'] == null
            ? []
            : listContentFromJson(jsonEncode(response.data['data']));

        event.value = body
            .where((e) => e.category.toString().toLowerCase().contains('event'))
            .toList();
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      eventLoading.value = false;
      update();
    }
  }

  Future<void> fetchPromo() async {
    try {
      final response = await contentsProvider.fetchContents();

      if (response.statusCode == 200) {
        final List<Content> body = response.data['data'] == null
            ? []
            : listContentFromJson(jsonEncode(response.data['data']));

        promo.value = body
            .where((e) => e.category.toString().toLowerCase().contains('promo'))
            .toList();
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      promoLoading.value = false;
      update();
    }
  }

  // Future<void> fetchContents() async {
  //   try {
  //     final response = await contentsProvider.fetchContents();

  //     if (response.statusCode == 200) {
  //       final List<Content> body = response.data['data'] == null
  //           ? []
  //           : listContentFromJson(jsonEncode(response.data['data']));

  //       event.value = body
  //           .where((e) => e.category.toString().toLowerCase().contains('event'))
  //           .toList();

  //       promo.value = body
  //           .where((e) => e.category.toString().toLowerCase().contains('promo'))
  //           .toList();
  //     }
  //   } on DioException catch (e) {
  //     failedSnackbar(
  //       'Ups sepertinya terjadi kesalahan',
  //       'code:${e.response?.statusCode}',
  //     );
  //   } finally {
  //     eventLoading.value = false;
  //     promoLoading.value = false;
  //     update();
  //   }
  // }

  Future<void> fetchDetailContent() async {
    detailContentLoading.value = true;

    try {
      final response = await contentsProvider.fetchDetailContent(slug.value);
      detailContent.value = contentFromJson(jsonEncode(response.data['data']));
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      detailContentLoading.value = false;
      update();
    }
  }

  // Future<void> refreshContents() async {
  //   await Future.delayed(const Duration(milliseconds: 2500), () {
  //     // contentsLoading.value = true;
  //     // fetchContents();
  //     if (currentTab.value == 0) {
  //       eventLoading.value = true;
  //       fetchContents();
  //     } else {
  //       promoLoading.value = true;
  //       fetchContents();
  //     }
  //   });
  // }

  Future<void> refreshEvent() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      eventLoading.value = true;
      fetchEvent();
    });
  }

  Future<void> refreshPromo() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      promoLoading.value = true;
      fetchPromo();
    });
  }
}
