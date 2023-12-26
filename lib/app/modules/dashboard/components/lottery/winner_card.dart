import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_shimmer.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class WinnerCard extends StatelessWidget {
  const WinnerCard({
    Key? key,
    required this.prizeImage,
    required this.prizeName,
    required this.listCustomer,
  }) : super(key: key);

  final String prizeImage;
  final String prizeName;
  final Widget listCustomer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 3,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  width: Get.width,
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: softPurpleColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: prizeName == ''
                            ? BaseShimmer(
                                child: Container(
                                  height: 17,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              )
                            : BaseText(
                                text: prizeName,
                                size: 16,
                                bold: FontWeight.w600,
                              ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: prizeImage == ''
                      ? BaseShimmer(
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 75,
                          width: 75,
                          child: Image.network(
                            '${ApiUrl.baseStorageUrl}/undian/$prizeImage',
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
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
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            listCustomer
          ],
        ),
      ),
    );
  }
}
