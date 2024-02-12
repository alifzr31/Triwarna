import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/show_qr.dart';

class GreetingHeaderHome extends StatelessWidget {
  const GreetingHeaderHome({
    super.key,
    required this.name,
    required this.noMember,
    this.token,
  });

  final String name;
  final String noMember;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: Get.width,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 70),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            softPurpleColor,
            purpleColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BaseText(
                      text: 'Halo, ',
                      size: 16,
                    ),
                    token == null
                        ? const BaseText(
                            text: 'Triwarna People',
                            size: 16,
                            bold: FontWeight.w600,
                          )
                        : name == ''
                            ? BaseShimmer(
                                child: Container(
                                  height: 16,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              )
                            : BaseText(
                                text: name,
                                size: 16,
                                bold: FontWeight.w600,
                              ),
                  ],
                ),
                const SizedBox(height: 5),
                token == null
                    ? const BaseText(
                        text:
                            'Bergabung bersama kami, dan dapatkan berbagai hadiah menarik',
                        bold: FontWeight.w500,
                      )
                    : RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text:
                                  'Redeem point untuk mendapatkan hadiah sampai\ndengan ',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: 'MOTOR!',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          if (noMember != '')
            InkWell(
              onTap: () {
                showQR(noMember);
              },
              child: Image.network(
                '${ApiUrl.baseStorageUrl}/${StorageUrl.qr}/$noMember.png',
                width: 70,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                            color: yellowColor,
                          ),
                        );
                },
              ),
            ),
        ],
      ),
    );
  }
}
