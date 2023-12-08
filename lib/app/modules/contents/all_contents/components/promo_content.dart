import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/contents/all_contents/components/card_contents.dart';
import 'package:triwarna_rebuild/app/modules/contents/controller.dart';

class PromoContent extends StatelessWidget {
  PromoContent({super.key});
  final controller = Get.find<ContentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.promoLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return const CardContentsLoading();
              },
            )
          : RefreshIndicator(
              onRefresh: controller.refreshPromo,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.promo.length,
                itemBuilder: (context, index) {
                  final contents = controller.promo[index];
                  final date = AppHelpers.dayDateFormat(
                      contents.createdAt ?? DateTime(0000));

                  return CardContents(
                    image: contents.featuredImage ?? '',
                    label: contents.category.toString().capitalize ?? '',
                    labelColor: purpleColor,
                    title: contents.title ?? '',
                    author: contents.authorId ?? '',
                    date: date,
                    onTap: () {
                      controller.title.value = contents.title;
                      controller.slug.value = contents.slug;
                      controller.date.value = date;
                      Get.toNamed('/detailContent');
                    },
                  );
                },
              ),
            ),
    );
  }
}
