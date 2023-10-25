import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard({
    Key? key,
    required this.point,
    required this.image,
    required this.prizeDesc,
    this.onPressed,
  }) : super(key: key);

  final String point;
  final String image;
  final String prizeDesc;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 2,
          color: yellowColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 5,
                ),
                child: BaseText(
                  text: '$point Poin',
                  color: Colors.white,
                  bold: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                        '${ApiUrl.baseStorageUrl}${StorageUrl.prize}/$image'),
                  ),
                  const SizedBox(height: 5),
                  BaseText(
                    text: prizeDesc,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    size: 13,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 35,
              width: Get.width,
              child: BaseButton(
                bgColor: purpleColor,
                fgColor: Colors.white,
                label: 'Tukar Poin',
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrizeCardLoading extends StatelessWidget {
  const PrizeCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 2,
          color: yellowColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: BaseShimmer(
                child: Container(
                  height: 22,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: BaseShimmer(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  BaseShimmer(
                    child: Container(
                      height: 20,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            BaseShimmer(
              child: Container(
                height: 35,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
