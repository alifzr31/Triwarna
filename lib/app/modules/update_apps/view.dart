import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/update_apps/controller.dart';

class UpdateApps extends StatelessWidget {
  const UpdateApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: baseBgScaffold,
        title: '',
        preferredSize: Size.zero,
      ),
      body: UpdateBody(),
    );
  }
}

class UpdateBody extends StatelessWidget {
  UpdateBody({super.key});
  final controller = Get.find<UpdateController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/update.svg',
                      width: 350,
                    ),
                    const SizedBox(height: 20),
                    const BaseText(
                      text: 'Update Tersedia!',
                      textAlign: TextAlign.center,
                      size: 18,
                      bold: FontWeight.w600,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(
                            text: controller.currentVersion.value ?? '',
                            textAlign: TextAlign.center,
                            color: Colors.grey.shade600,
                            bold: FontWeight.w500,
                          ),
                          const Icon(Icons.arrow_right_alt),
                          BaseText(
                            text: controller.updateVersion.value ?? '',
                            textAlign: TextAlign.center,
                            color: Colors.green,
                            bold: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    BaseText(
                      text: 'Silahkan update aplikasi Triwarna anda ke versi terbaru untuk memaksimalkan performa dan meminimalisir bugs. Tekan tombol update sekarang untuk melakukan update aplikasi Triwarna.\nTerima Kasih!!!',
                      size: 12.5,
                      textAlign: TextAlign.center,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseOutlineButton(
                      borderColor: purpleColor,
                      fgColor: purpleColor,
                      label: 'Mungkin Nanti',
                      onPressed: controller.navigator,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: BaseButton(
                      bgColor: purpleColor,
                      fgColor: Colors.white,
                      label: 'Update Sekarang',
                      onPressed: controller.updatePlayStore,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
