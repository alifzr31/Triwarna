import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class HeaderStore extends StatelessWidget {
  HeaderStore({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    onChanged: (value) => controller.findStore.value = value,
                    onTap: () {
                      controller.boxController.value.showBox();
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari Toko',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      filled: true,
                      hintStyle: const TextStyle(color: purpleColor),
                      fillColor: softPurpleColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(softPurpleColor),
                  foregroundColor: MaterialStatePropertyAll(purpleColor),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  elevation: MaterialStatePropertyAll(1),
                ),
                onPressed: () {
                  controller.refreshLocation();
                },
                color: purpleColor,
                icon: const Icon(EvaIcons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
