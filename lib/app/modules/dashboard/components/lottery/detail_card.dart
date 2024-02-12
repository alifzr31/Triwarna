import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.noUndian,
  });

  final String noUndian;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF493169),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/kupon.svg',
              width: 35,
            ),
            Expanded(
              child: Center(
                child: Text(
                  noUndian,
                  style: const TextStyle(
                    color: Color(0xFF493169),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/kupon.svg',
              width: 35,
            ),
          ],
        ),
      ),
    );
  }
}
