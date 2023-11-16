import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/app_helpers.dart';
import 'package:triwarna_rebuild/app/modules/shopping/controller.dart';

class ShoppingDetailHistoryPage extends StatefulWidget {
  const ShoppingDetailHistoryPage({super.key});

  @override
  State<ShoppingDetailHistoryPage> createState() =>
      _ShoppingDetailHistoryPageState();
}

class _ShoppingDetailHistoryPageState extends State<ShoppingDetailHistoryPage> {
  final controller = Get.find<ShoppingController>();

  @override
  void initState() {
    controller.fetchShoppingDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.45,
      width: Get.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/shopping_history.svg',
                  width: 30,
                ),
                const SizedBox(height: 10),
                const BaseText(
                  text: 'Detail Belanja',
                  textAlign: TextAlign.center,
                  size: 16,
                  bold: FontWeight.w600,
                ),
                BaseText(
                  text: controller.date.value ?? '',
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                const Divider(),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.shoppingDetailLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            physics: const ClampingScrollPhysics(),
                            itemCount: controller.shoppingDetail.length,
                            itemBuilder: (context, index) {
                              final shoppingDetail =
                                  controller.shoppingDetail[index];
                              final harga = AppHelpers.rupiahFormat(
                                  int.parse(shoppingDetail.harga ?? '0'));

                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          shoppingDetail.dscription
                                                  ?.toUpperCase() ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Text('$harga (x${shoppingDetail.qty})'),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const BaseText(
                                  text: 'Total Harga',
                                  size: 12,
                                ),
                                BaseText(
                                  text: controller.total.value ?? '',
                                  bold: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: BaseText(
              text:
                  'Berbagai macam hadiah menarik untuk setiap pembelian produk di Triwarna',
              size: 13,
              textAlign: TextAlign.center,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
