import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/core/utils/firebase_notif.dart';
import 'package:triwarna_rebuild/app/core/values/snackbars.dart';
import 'package:triwarna_rebuild/app/data/models/content.dart';
import 'package:triwarna_rebuild/app/data/models/lottery.dart';
import 'package:triwarna_rebuild/app/data/models/profile.dart';
import 'package:triwarna_rebuild/app/data/models/store.dart';
import 'package:triwarna_rebuild/app/data/providers/dashboard_provider.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/bottomnav_checkprofile.dart';

class DashboardController extends GetxController {
  final DashboardProvider dashboardProvider;

  DashboardController({required this.dashboardProvider});

  final tabIndex = 0.obs;
  final contentIndex = 0.obs;
  final appName = Rx<String?>(null);
  final version = Rx<String?>(null);
  final token = Rx<String?>(null);

  final profile = Rx<Profile?>(null);
  final profileLoading = true.obs;
  final jumlahNull = 0.obs;
  final completePercent = Rx<String?>(null);

  final content = <Content>[].obs;
  final contentLoading = true.obs;

  final lottery = <Lottery>[].obs;
  final lotteryLoading = true.obs;
  var hasMore = true.obs;
  final currentPageLottery = 1.obs;
  final itemLottery = 20;
  final scrollController = ScrollController().obs;
  final currentDate = Rx<String?>(null);

  final googleMapController = Completer<GoogleMapController>().obs;
  final mapController = Rx<GoogleMapController?>(null);
  final boxController = BoxController().obs;

  final positionStream = Rx<StreamSubscription<Position>?>(null);
  final lat = Rx<double?>(null);
  final long = Rx<double?>(null);
  final store = <Store>[].obs;
  final locationLoading = false.obs;
  final storeLoading = false.obs;
  var servicestatus = false.obs;
  var haspermission = false.obs;

  var markers = RxSet<Marker>();
  final selectedLat = Rx<double?>(null);
  final selectedLong = Rx<double?>(null);

  final findStore = Rx<String?>(null);
  final noMember = Rx<String?>(null);
  final birthDate = Rx<String?>(null);

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    FirebaseNotif firebaseNotif = FirebaseNotif();
    firebaseNotif.firebaseInit();
    firebaseNotif.requestNotificationPermission();
    token.value = sharedPreferences.getString('token');
    appName.value = packageInfo.appName;
    version.value = packageInfo.version;
    final formatter = DateFormat('yyyy');
    final year = formatter.format(DateTime.now());
    currentDate.value = '31 Desember $year';

    if (token.value != null) {
      await fetchProfile();
      await fetchLottery();
      scrollController.value.addListener(onScroll);

      if (profile.value != null) {
        final formatter = DateFormat('dd MMMM yyyy');
        if (profile.value?.birthDate != null) {
          birthDate.value = formatter.format(profile.value!.birthDate!);
        } else {
          birthDate.value = null;
        }

        if (profile.value?.complete == false) {
          await checkProfile();
        }
      }
    }
    await sendDeviceToken();
    await fetchContent();
    await fetchLocation();
    super.onInit();
  }

  @override
  void onClose() {
    content.clear();
    lottery.clear();
    store.clear();
    positionStream.value?.cancel();
    googleMapController.value = Completer();
    mapController.value?.dispose();
    super.onClose();
  }

  Future<void> sendDeviceToken() async {
    try {
      await dashboardProvider.sendDeviceToken();
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
    }
  }

  Future<void> fetchProfile() async {
    try {
      final response = await dashboardProvider.fetchProfile();
      profile.value = profileFromJson(jsonEncode(response.data));
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('complete', profile.value!.complete!);
      addSpaces(profile.value?.noMember ?? '');
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      profileLoading.value = false;
      update();
    }
  }

  Future<void> checkProfile() async {
    if (profile.value?.name == null) jumlahNull.value++;
    if (profile.value?.username == null) jumlahNull.value++;
    if (profile.value?.email == null) jumlahNull.value++;
    if (profile.value?.birthPlace == null) jumlahNull.value++;
    if (profile.value?.birthDate == null) jumlahNull.value++;
    if (profile.value?.gender == null) jumlahNull.value++;
    if (profile.value?.address == null) jumlahNull.value++;
    if (profile.value?.village == null) jumlahNull.value++;
    if (profile.value?.religion == null) jumlahNull.value++;
    if (profile.value?.idType == null) jumlahNull.value++;
    if (profile.value?.idNumber == null) jumlahNull.value++;
    if (profile.value?.education == null) jumlahNull.value++;
    if (profile.value?.job == null) jumlahNull.value++;
    if (profile.value?.maritalStatus == null) jumlahNull.value++;

    final hitung = ((14 - jumlahNull.value) / 14) * 100;
    completePercent.value = '${hitung.round()}%';

    Get.bottomSheet(
      backgroundColor: Colors.white,
      isDismissible: false,
      enableDrag: false,
      BottomNavCheckProfile(),
    );
  }

  Future<void> fetchContent() async {
    try {
      final response = await dashboardProvider.fetchContent();
      final List<Content> body = response.data['data'] == null
          ? []
          : listContentFromJson(jsonEncode(response.data['data']));

      content.value = body;
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      contentLoading.value = false;
      update();
    }
  }

  Future<void> fetchLottery() async {
    try {
      final response = await dashboardProvider.fetchLottery(
        currentPageLottery.value,
        itemLottery,
      );
      final List<Lottery> body = response.data['data'].isEmpty
          ? []
          : response.data['data']['data'] == null
              ? []
              : listLotteryFromJson(jsonEncode(response.data['data']['data']));

      if (body.length < itemLottery) {
        hasMore.value = false;
      }

      lottery.addAll(body);
      currentPageLottery.value++;
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      lotteryLoading.value = false;
      update();
    }
  }

  void onScroll() {
    double maxScroll = scrollController.value.position.maxScrollExtent;
    double currentScroll = scrollController.value.position.pixels;

    if (maxScroll == currentScroll && hasMore.value) {
      fetchLottery();
    }
  }

  Future<void> fetchLocation() async {
    locationLoading.value = true;
    try {
      late Position position;

      servicestatus.value = false;
      haspermission.value = false;
      late LocationPermission permission;

      servicestatus.value = await Geolocator.isLocationServiceEnabled();

      if (servicestatus.value) {
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            infoSnackbar(
              'Akses GPS Tidak Diizinkan',
              'Mohon izinkan aplikasi untuk selalu bisa mengakses GPS',
            );
          } else if (permission == LocationPermission.deniedForever) {
            infoSnackbar(
              'Akses GPS Tidak Diizinkan',
              'Mohon izinkan aplikasi untuk selalu bisa mengakses GPS',
            );
          } else {
            haspermission.value = true;
          }
        } else {
          haspermission.value = true;
        }

        if (haspermission.value) {
          position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best);

          lat.value = position.latitude;
          long.value = position.longitude;

          LocationSettings locationSettings = const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 100,
          );

          positionStream.value =
              Geolocator.getPositionStream(locationSettings: locationSettings)
                  .listen((Position position) {
            lat.value = position.latitude;
            long.value = position.longitude;
          });

          await fetchStore();

          update();
        }
      } else {
        infoSnackbar(
          'GPS Tidak Aktif',
          'Mohon aktifkan GPS untuk melakukan absen',
        );
      }
    } catch (e) {
      failedSnackbar('Gagal Menangkap Lokasi', e.toString());
    } finally {
      locationLoading.value = false;
      update();
    }
  }

  Future<void> fetchStore() async {
    storeLoading.value = true;

    try {
      final response =
          await dashboardProvider.fetchStore(lat.value, long.value);
      final List<Store> body = response.data['data'] == null
          ? []
          : listStoreFromJson(jsonEncode(response.data['data']));

      store.value = body;
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:${e.response?.statusCode}',
      );
    } finally {
      storeLoading.value = false;
      await createMarkers();
      update();
    }
  }

  Future<void> createMarkers() async {
    store.forEach((element) async {
      markers.add(
        Marker(
          markerId: MarkerId(element.id.toString()),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            'assets/images/mapicon.png',
          ),
          position: LatLng(
            double.parse(element.lat ?? ''),
            double.parse(element.long ?? ''),
          ),
          infoWindow: InfoWindow(
            title: element.storeName,
            snippet: element.address,
          ),
          onTap: () {
            // visible.value = true;
          },
        ),
      );
    });
  }

  Future<void> moveStore() async {
    final GoogleMapController mapController =
        await googleMapController.value.future;
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            selectedLat.value ?? double.parse(store.first.lat ?? ''),
            selectedLong.value ?? double.parse(store.first.lat ?? ''),
          ),
          zoom: 13,
        ),
      ),
    );
  }

  Future<void> myLocation() async {
    mapController.value = await googleMapController.value.future;
    await mapController.value?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            lat.value!,
            long.value!,
          ),
          zoom: 13,
        ),
      ),
    );
  }

  Future<void> refreshHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () async {
      if (token.value == null) {
        contentLoading.value = true;
        await sendDeviceToken();
        await fetchContent();
        await refreshLocation();
      } else {
        profile.value = null;
        contentLoading.value = true;
        await fetchProfile();
        await sendDeviceToken();
        await fetchContent();
        await refreshLocation();
        addSpaces(profile.value?.noMember ?? '');
      }
    });
  }

  Future<void> refreshLocation() async {
    googleMapController.value = Completer();
    await fetchLocation();
  }

  Future<void> refreshLottery() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      lotteryLoading.value = true;
      currentPageLottery.value = 1;
      hasMore.value = true;
      lottery.clear();

      await fetchLottery();
    });
  }

  void addSpaces(String input) {
    List<String> chunks = [];
    int length = input.length;
    for (int i = 0; i < length; i += 4) {
      chunks.add(input.substring(i, i + 4 < length ? i + 4 : length));
    }
    noMember.value = chunks.join(' ');
  }
}
