import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_searchnotfound.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/custom_bottomsheet.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/prize_card.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/components/select_toko_widget.dart';

class ListPrize extends StatelessWidget {
  ListPrize({super.key});
  final controller = Get.find<PointController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.prizeLoading.value
            ? GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return const PrizeCardLoading();
                },
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: controller.searchController.value,
                      decoration: InputDecoration(
                        hintText: 'Cari hadiah...',
                        contentPadding: const EdgeInsets.all(10),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: purpleColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: yellowColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: controller.searchPrize.value != null &&
                                controller.searchPrize.value != ''
                            ? IconButton(
                                onPressed: () {
                                  controller.searchPrize.value = null;
                                  controller.searchController.value.text = '';
                                },
                                icon: const Icon(EvaIcons.close),
                              )
                            : null,
                      ),
                      onChanged: (value) {
                        controller.searchPrize.value = value;
                        controller.filteredPrize.value = controller.prize
                            .where((e) =>
                                e.prizeName
                                    .toString()
                                    .toLowerCase()
                                    .contains(value) ||
                                e.prizeDesc
                                    .toString()
                                    .toLowerCase()
                                    .contains(value))
                            .toList();
                      },
                    ),
                  ),
                  Expanded(
                    child: controller.searchPrize.value != null &&
                            controller.filteredPrize.isEmpty
                        ? BaseSearchNotFound(
                            title: 'Hadiah Tidak Ditemukan',
                            subtitle: 'Hadiah "${controller.searchPrize.value}" tidak ditemukan',
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: controller.searchPrize.value == null
                                ? controller.prize.length
                                : controller.filteredPrize.length,
                            itemBuilder: (context, index) {
                              final prize = controller.searchPrize.value == null
                                  ? controller.prize[index]
                                  : controller.filteredPrize[index];
                              final point = int.parse(prize.point.toString());
                              final userPoint =
                                  int.parse(controller.lastPoint.value ?? '');

                              return PrizeCard(
                                  point: prize.point ?? '',
                                  image: prize.image ?? '',
                                  prizeDesc: prize.prizeDesc ?? '',
                                  onPressed: userPoint < 50 || userPoint < point
                                      ? null
                                      : () {
                                          customBottomSheet(
                                            330,
                                            SelectTokoWidget(
                                              prize: prize,
                                              pin: userController
                                                  .profile.value?.pin,
                                            ),
                                          );
                                        });
                            },
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
