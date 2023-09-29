import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/core/values/loading.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/kelurahan.dart';
import 'package:triwarna_rebuild/app/data/providers/auth_provider.dart';
import 'package:triwarna_rebuild/app/data/providers/profile_provider.dart';
import 'package:triwarna_rebuild/app/modules/auth/controller.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/edit_profile/components/jobs_model.dart';

class ProfileController extends GetxController {
  final ProfileProvider profileProvider;

  ProfileController({required this.profileProvider});

  final formKeyChangePass = GlobalKey<FormState>().obs;
  final currentPasswordController = TextEditingController().obs;
  final showCurrentPass = true.obs;
  final newPasswordController = TextEditingController().obs;
  final showNewPass = true.obs;
  final confirmPasswordController = TextEditingController().obs;
  final showConfirmPass = true.obs;

  final formKeyCreatePin = GlobalKey<FormState>().obs;
  final createNewPinController = TextEditingController().obs;
  final showCreateNewPin = true.obs;
  final createConfirmPinController = TextEditingController().obs;
  final showCreateConfirmNewPin = true.obs;

  final formKeyChangePin = GlobalKey<FormState>().obs;
  final changeCurrentPinController = TextEditingController().obs;
  final showChangeCurrentPin = true.obs;
  final changeNewPinController = TextEditingController().obs;
  final showChangeNewPin = true.obs;
  final changeConfirmPinController = TextEditingController().obs;
  final showChangeConfirmNewPin = true.obs;

  final kelurahan = <Kelurahan>[].obs;
  final kelurahanLoading = true.obs;

  final formKeyEditProfil = GlobalKey<FormState>().obs;
  final namaController = TextEditingController().obs;
  final profileImage = Rx<XFile?>(null);
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final tempatLahirController = TextEditingController().obs;
  final kelurahanController = TextEditingController().obs;
  final tglLahirController = TextEditingController().obs;
  final alamatController = TextEditingController().obs;
  final noIndentitasController = TextEditingController().obs;

  final showImage = false.obs;

  final selectJk = Rx<String?>(null);
  final jenisKelamin = [
    'Laki-Laki',
    'Perempuan',
  ].obs;

  final selectAgama = Rx<String?>(null);
  final agama = [
    'Islam',
    'Protestan',
    'Katolik',
    'Konghucu',
    'Hindu',
    'Buddha',
  ].obs;

  final selectIdentitas = Rx<String?>(null);
  final identitas = [
    'KTP',
    'SIM',
  ].obs;

  final selectPendidikan = Rx<String?>(null);
  final pendidikan = [
    'SD',
    'SMP',
    'SMA',
    'D3',
    'S1',
    'S2/S3',
  ].obs;

  final selectPekerjaan = Rx<String?>(null);
  final pekerjaan = [
    Jobs(id: '1', nama: 'Umum'),
    Jobs(id: '2', nama: 'Kontraktor'),
    Jobs(id: '3', nama: 'Tukang'),
    Jobs(id: '4', nama: 'Mandor'),
  ];

  final selectTglLahir = Rx<DateTime?>(null);
  final selectKelurahan = Rx<String?>(null);

  final selectStatus = Rx<String?>(null);
  final status = [
    'Menikah',
    'Belum Menikah',
  ].obs;

  final userController = Get.find<DashboardController>();

  @override
  void onInit() {
    if (Get.currentRoute == '/editProfile') {
      final formatter = DateFormat('dd MMMM yyyy');

      if (userController.profile.value != null) {
        namaController.value.text = userController.profile.value?.name ?? '';
        usernameController.value.text =
            userController.profile.value?.username ?? '';
        emailController.value.text = userController.profile.value?.email ?? '';
        tempatLahirController.value.text =
            userController.profile.value?.birthPlace ?? '';
        selectTglLahir.value = userController.profile.value?.birthDate;
        tglLahirController.value.text = formatter
            .format(userController.profile.value?.birthDate ?? DateTime(0000));
        selectJk.value = userController.profile.value?.gender;
        alamatController.value.text =
            userController.profile.value?.address ?? '';
        if (userController.profile.value?.village != null) {
          kelurahanController.value.text =
              userController.profile.value?.village ?? '';
        }
        selectKelurahan.value = userController.profile.value?.villageId;
        selectAgama.value = userController.profile.value?.religion;
        selectPendidikan.value = userController.profile.value?.education;
        selectIdentitas.value = userController.profile.value?.idType;
        noIndentitasController.value.text =
            userController.profile.value?.idNumber ?? '';
        if (userController.profile.value?.job == 'Umum') {
          selectPekerjaan.value = '1';
        } else if (userController.profile.value?.job == 'Kontraktor') {
          selectPekerjaan.value = '2';
        } else if (userController.profile.value?.job == 'Tukang') {
          selectPekerjaan.value = '3';
        } else if (userController.profile.value?.job == 'Mandor') {
          selectPekerjaan.value = '4';
        }
        selectStatus.value = userController.profile.value?.maritalStatus;
      }

      fetchKelurahan();
    }
    super.onInit();
  }

  @override
  void onClose() {
    kelurahan.clear();
    currentPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    createNewPinController.value.dispose();
    createConfirmPinController.value.dispose();
    changeCurrentPinController.value.dispose();
    changeNewPinController.value.dispose();
    changeConfirmPinController.value.dispose();
    namaController.value.dispose();
    usernameController.value.dispose();
    emailController.value.dispose();
    tempatLahirController.value.dispose();
    tglLahirController.value.dispose();
    alamatController.value.dispose();
    noIndentitasController.value.dispose();
    super.onClose();
  }

  Future<void> fetchKelurahan() async {
    try {
      final response = await profileProvider.fetchKelurahan();
      final List<Kelurahan> body = response.data['data'] == null
          ? []
          : listKelurahanFromJson(jsonEncode(response.data['data']));

      kelurahan.value = body;
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Load Kelurahan Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      kelurahanLoading.value = false;
      update();
    }
  }

  void editProfile() async {
    final formData = dio.FormData.fromMap({
      'name': namaController.value.text,
      if (profileImage.value != null)
        'image':
            await dio.MultipartFile.fromFile(profileImage.value?.path ?? ''),
      'gender': selectJk.value,
      'id_type': selectIdentitas.value,
      'id_number': noIndentitasController.value.text,
      'education': selectPendidikan.value,
      'address': alamatController.value.text,
      'village': selectKelurahan.value,
      'job_code': selectPekerjaan.value,
      'birth_place': tempatLahirController.value.text,
      'birth_date': selectTglLahir.value,
      'religion': selectAgama.value,
      'marital_status': selectStatus.value
    });

    showLoading();

    try {
      await profileProvider.editProfile(formData);
      successSnackbar('Edit Profil Berhasil', 'Profil anda berhasil di edit');
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar('Edit Profil Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    } finally {
      userController.fetchProfile();
    }
  }

  void changePass() async {
    final formData = dio.FormData.fromMap({
      'current_password': currentPasswordController.value.text,
      'new_password': newPasswordController.value.text,
      'confirm_password': confirmPasswordController.value.text,
    });

    showLoading();

    try {
      final response = await profileProvider.changePass(formData);

      if (response.statusCode == 200) {
        successSnackbar('Ganti Password Berhasil',
            'Password berhasil diganti. Silahkan lakukan log in ulang');
        final authController =
            Get.put(AuthController(authProvider: AuthProvider()));
        authController.logout();
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
            'Ganti Password Gagal', e.response?.data.toString() ?? '');
      } else if (e.response?.statusCode == 422) {
        infoSnackbar('Ganti Password Gagal', e.response?.data['message']);
      } else {
        infoSnackbar('Ganti Password Gagal', e.response?.data.toString() ?? '');
      }
    }
  }

  void createPin() async {
    final formData = dio.FormData.fromMap({
      'new_pin': createNewPinController.value.text,
      'confirm_pin': createConfirmPinController.value.text,
    });

    showLoading();

    try {
      await profileProvider.createPin(formData);
      successSnackbar('Buat PIN Berhasil',
          'PIN berhasil dibuat untuk mengamankan akun anda');
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Buat PIN Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    }
  }

  void changePin() async {
    final formData = dio.FormData.fromMap({
      'current_pin': changeCurrentPinController.value.text,
      'new_pin': changeNewPinController.value.text,
      'confirm_pin': changeConfirmPinController.value.text,
    });

    showLoading();

    try {
      await profileProvider.changePin(formData);
      successSnackbar(
          'Ganti PIN Berhasil', 'PIN keamanan akun anda berhasil diganti');
      Get.offAllNamed('/dashboard');
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 500) {
        failedSnackbar('Ganti PIN Gagal', 'Ups sepertinya terjadi kesalahan');
      }
    }
  }
}
