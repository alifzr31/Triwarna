import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/contents/all_contents/components/card_contents.dart';
import 'package:triwarna_rebuild/app/modules/contents/controller.dart';

class BodyContents extends StatelessWidget {
  BodyContents({super.key});
  final controller = Get.find<ContentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.contentsLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return const CardContentsLoading();
              },
            )
          : controller.contents.isEmpty
              ? BaseNoData(
                  label: 'Event dan Promo Tidak Ditemukan',
                  labelButton: 'Refresh Event dan Promo',
                  onPressed: () {
                    controller.contentsLoading.value = true;
                    controller.fetchContents();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshContents,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.contents.length,
                    itemBuilder: (context, index) {
                      final contents = controller.contents[index];
                      final formatter = DateFormat('dd MMMM yyyy');
                      final date = formatter
                          .format(contents.createdAt ?? DateTime(0000));

                      return CardContents(
                        image: contents.featuredImage ?? '',
                        label: contents.category.toString().capitalize ?? '',
                        labelColor: contents.category == 'event'
                            ? yellowColor
                            : purpleColor,
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
