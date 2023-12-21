import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class ContentHome extends StatelessWidget {
  ContentHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BaseText(
                          text: 'Event & Promo',
                          size: 16,
                          bold: FontWeight.w600,
                        ),
                        BaseText(
                          text: 'Temukan promo menarik dari triwarna',
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/contents');
                    },
                    child: const BaseText(
                      text: 'Lihat Semua',
                      color: purpleColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: controller.contentLoading.value
                  ? Swiper(
                      loop: true,
                      viewportFraction: 0.75,
                      scale: 0.85,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return BaseShimmer(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                    )
                  : Swiper(
                      loop: true,
                      index: controller.contentIndex.value,
                      onIndexChanged: (index) =>
                          controller.contentIndex.value = index,
                      viewportFraction: 0.75,
                      scale: 0.85,
                      itemCount: controller.content.length,
                      onTap: (index) {
                        final date = AppHelpers.dateFormat(
                            controller.content[index].createdAt ??
                                DateTime(0000));
                        Get.toNamed(
                          '/detailContent',
                          arguments: [
                            controller.content[index].title,
                            controller.content[index].slug,
                            date,
                          ],
                        );
                      },
                      itemBuilder: (context, index) {
                        final content = controller.content[index];

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: Image.network(
                                '${ApiUrl.baseStorageUrl}/contents/${content.featuredImage}',
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  return loadingProgress == null
                                      ? child
                                      : Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                },
                              ).image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
            ),
            if (controller.contentLoading.isFalse) const SizedBox(height: 15),
            if (controller.contentLoading.isFalse)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.content.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: controller.contentIndex.value == index ? 12 : 8,
                    height: controller.contentIndex.value == index ? 12 : 8,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: controller.contentIndex.value == index
                          ? purpleColor
                          : yellowColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
