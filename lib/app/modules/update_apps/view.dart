import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/update_apps/controller.dart';

class UpdateApps extends StatelessWidget {
  const UpdateApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateBody(),
    );
  }
}

class UpdateBody extends StatelessWidget {
  UpdateBody({super.key});
  final controller = Get.put(UpdateController());

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
                    BaseText(
                      text: 'Update Triwarna Tersedia',
                      size: 22,
                      bold: FontWeight.bold,
                    ),
                    SvgPicture.asset('assets/images/logo.svg', width: 200),
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
                      onPressed: () {
                        Get.offAndToNamed('/dashboard');
                      },
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
