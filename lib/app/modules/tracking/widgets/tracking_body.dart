import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/tracking/components/tracking_item.dart';
import 'package:triwarna_rebuild/app/modules/tracking/controller.dart';

class TrackingBody extends StatelessWidget {
  TrackingBody({super.key});
  final controller = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Container(
          width: Get.width,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BaseText(
                      text: 'Status',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: 'Pengiriman',
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: controller.tracking.value == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: controller
                            .tracking.value!.statusHadiahDetail!.length,
                        itemBuilder: (context, index) {
                          final tracking = controller
                              .tracking.value!.statusHadiahDetail![index];
                          final length = controller
                              .tracking.value!.statusHadiahDetail!.length;
                          final date = AppHelpers.dayDateFormat(
                              tracking.date ?? DateTime(0000));

                          return TrackingItem(
                            index: index,
                            length: length,
                            date: date,
                            receipt: controller.tracking.value?.receipt,
                            status: tracking.status ?? '',
                            showPhoto: () {
                              Get.dialog(
                                barrierColor: Colors.black.withOpacity(0.3),
                                barrierDismissible: true,
                                Center(
                                  child: SizedBox(
                                    height: 350,
                                    width: 350,
                                    child: PhotoView(
                                      imageProvider: Image.network(
                                              'http://staging.triwarna.co.id/storage/attachments/${controller.tracking.value?.receipt?.image}')
                                          .image,
                                      backgroundDecoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            showSignature: () {
                              Get.dialog(
                                barrierColor: Colors.black.withOpacity(0.3),
                                barrierDismissible: true,
                                Center(
                                  child: SizedBox(
                                    height: 350,
                                    width: 350,
                                    child: PhotoView(
                                      imageProvider: Image.network(
                                              'http://staging.triwarna.co.id/storage/signatures/${controller.tracking.value?.receipt?.signature}')
                                          .image,
                                      backgroundDecoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
