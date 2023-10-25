import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/data/models/tracking.dart';

class TrackingItem extends StatelessWidget {
  const TrackingItem({
    Key? key,
    required this.index,
    required this.length,
    required this.date,
    required this.status,
    this.receipt,
    this.showPhoto,
    this.showSignature,
  }) : super(key: key);

  final int index;
  final int length;
  final String date;
  final String status;
  final Receipt? receipt;
  final void Function()? showPhoto;
  final void Function()? showSignature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: index != 0 ? Colors.grey.shade400 : Colors.green,
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.check,
                size: 30,
              ),
            ),
            if (index != (length - 1))
              Container(
                height: 25,
                width: 2,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                text: date,
                size: 12,
                color: index != 0 ? Colors.grey.shade600 : Colors.black,
              ),
              BaseText(
                text: status,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                bold: FontWeight.w600,
                color: index != 0 ? Colors.grey.shade600 : Colors.black,
              ),
              if (length == 4 && receipt != null)
                if (index == 0 && length > 3) const SizedBox(height: 5),
              if (length == 4 && receipt != null)
                if (index == 0 && length > 3)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: showPhoto,
                        child: const BaseText(
                          text: 'Lihat Foto',
                          size: 12,
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: showSignature,
                        child: const BaseText(
                          text: 'Lihat Tanda Tangan',
                          size: 12,
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              if (length == 5 && receipt != null)
                if (index == 0 && length > 4) const SizedBox(height: 5),
              if (length == 5 && receipt != null)
                if (index == 0 && length > 4)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: showPhoto,
                        child: const BaseText(
                          text: 'Lihat Foto',
                          size: 12,
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: showSignature,
                        child: const BaseText(
                          text: 'Lihat Tanda Tangan',
                          size: 12,
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
