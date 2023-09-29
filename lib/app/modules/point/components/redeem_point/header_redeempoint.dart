import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';

class HeaderRedeemPoint extends StatelessWidget {
  HeaderRedeemPoint({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) => controller.searchPrize.value = value,
                    decoration: const InputDecoration(
                      hintText: 'Cari Hadiah',
                      suffixIcon: const Icon(EvaIcons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SvgPicture.asset('assets/images/point_icon.svg', width: 30),
                BaseText(
                  text: controller.lastPoint.value ?? '',
                  size: 18,
                  color: yellowColor,
                  bold: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
