import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class NearestBox extends StatelessWidget {
  const NearestBox({
    super.key,
    required this.storeName,
    required this.address,
    required this.distance,
    this.onTap,
  });

  final String storeName;
  final String address;
  final String distance;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Card(
        color: Colors.white,
        elevation: 3,
        surfaceTintColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: storeName,
                        size: 16,
                        bold: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      BaseText(
                        text: address,
                        size: 12,
                        color: Colors.grey.shade600,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 20,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: yellowColor.withOpacity(0.5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BaseText(
                    text: '$distance KM',
                    color: const Color(0xFF323232),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
