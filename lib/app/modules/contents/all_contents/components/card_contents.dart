import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';

class CardContents extends StatelessWidget {
  const CardContents({
    Key? key,
    required this.image,
    required this.label,
    required this.title,
    required this.author,
    required this.date,
    this.labelColor,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String label;
  final String title;
  final String author;
  final String date;
  final Color? labelColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      width: Get.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                            '${ApiUrl.baseStorageUrl}/contents/$image')
                        .image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: labelColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: BaseText(
                              text: label,
                              size: 12,
                              color: Colors.white,
                              bold: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          BaseText(
                            text: title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            bold: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: 'Author : $author',
                            size: 12,
                            color: Colors.grey.shade600,
                          ),
                          BaseText(
                            text: date,
                            size: 12,
                            color: Colors.grey.shade600,
                            bold: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
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

class CardContentsLoading extends StatelessWidget {
  const CardContentsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      elevation: 3,
      child: Row(
        children: [
          BaseShimmer(
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseShimmer(
                    child: Container(
                      height: 14,
                      width: 60,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BaseShimmer(
                    child: Container(
                      height: 18,
                      width: Get.width,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BaseShimmer(
                    child: Container(
                      height: 14,
                      width: 120,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(height: 5),
                  BaseShimmer(
                    child: Container(
                      height: 14,
                      width: 120,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
