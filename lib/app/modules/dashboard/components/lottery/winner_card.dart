import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
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
                        child: BaseText(
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
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: Image.asset(
                      'assets/images/$prizeImage',
                      fit: BoxFit.cover,
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
