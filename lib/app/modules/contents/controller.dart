import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/content.dart';
import 'package:triwarna_rebuild/app/data/providers/contents_provider.dart';

class ContentsController extends GetxController {
  final ContentsProvider contentsProvider;

  ContentsController({required this.contentsProvider});

  final contents = <Content>[].obs;
  final contentsLoading = true.obs;

  final title = Rx<String?>(null);
  final slug = Rx<String?>(null);
  final date = Rx<String?>(null);
  final detailContent = Rx<Content?>(null);
  final detailContentLoading = false.obs;
  
  @override
  void onInit() {
    fetchContents();
    super.onInit();
  }

  @override
  void onClose() {
    contents.clear();
    super.onClose();
  }

  Future<void> fetchContents() async {
    try {
      final response = await contentsProvider.fetchContents();
      final List<Content> body = response.data['data'] == null ? [] : listContentFromJson(jsonEncode(response.data['data']));

      contents.value = body;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Konten Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      contentsLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailContent() async {
    detailContentLoading.value = true;

    try {
      final response = await contentsProvider.fetchDetailContent(slug.value);
      detailContent.value = contentFromJson(jsonEncode(response.data['data']));
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Load Detail Konten Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      detailContentLoading.value = false;
      update();
    }
  }

  Future<void> refreshContents() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      contentsLoading.value = true;
      fetchContents();
    });
  }
}