import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/data/models/tracking.dart';
import 'package:shimmer/shimmer.dart';

class TrackingItem extends StatelessWidget {
  const TrackingItem({
    super.key,
    required this.index,
    required this.length,
    required this.date,
    required this.status,
    this.receipt,
    this.showPhoto,
    this.showSignature,
  });

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
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: index != 0 ? Colors.grey.shade600 : Colors.black,
                ),
              ),
              Text(
                status,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: index != 0 ? Colors.grey.shade600 : Colors.black,
                ),
              ),
              if (length == 4 && receipt != null)
                if (index == 0 && length > 3) const SizedBox(height: 5),
              if (length == 4 && receipt != null)
                if (index == 0 && length > 3)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: showPhoto,
                        child: const Text(
                          'Lihat Foto',
                          style: TextStyle(
                            fontSize: 12,
                            color: purpleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: showSignature,
                        child: const Text(
                          'Lihat Tanda Tangan',
                          style: TextStyle(
                            fontSize: 12,
                            color: purpleColor,
                            fontWeight: FontWeight.w500,
                          ),
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
                        onTap: () {},
                        child: const Text(
                          'Lihat Foto',
                          style: TextStyle(
                            fontSize: 12,
                            color: purpleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Lihat Tanda Tangan',
                          style: TextStyle(
                            fontSize: 12,
                            color: purpleColor,
                            fontWeight: FontWeight.w500,
                          ),
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

class TrackingItemLoading extends StatelessWidget {
  const TrackingItemLoading({
    super.key,
    required this.index,
    required this.length,
  });

  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                foregroundColor: Colors.white,
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
                Container(
                  height: 12,
                  width: 130,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(bottom: 5),
                ),
                Container(
                  height: 14,
                  width: 155,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(bottom: 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
