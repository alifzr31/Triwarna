import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class CardDetailLottery extends StatelessWidget {
  const CardDetailLottery({
    Key? key,
    required this.couponNumber,
  }) : super(key: key);

  final String couponNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: softPurpleColor,
      margin: const EdgeInsets.only(bottom: 8),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: purpleColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/kupon.svg',
              width: 50,
            ),
            Expanded(
              child: Center(
                child: BaseText(
                  text: couponNumber,
                  color: purpleColor,
                  size: 16,
                  bold: FontWeight.w600,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
