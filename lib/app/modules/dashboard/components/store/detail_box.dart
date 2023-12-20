import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class DetailBox extends StatelessWidget {
  const DetailBox({
    Key? key,
    required this.storeName,
    required this.storeAddress,
    required this.storePhone,
    required this.storeDistance,
    this.onTapPhone,
    this.lat,
    this.long,
    this.directionPressed,
  }) : super(key: key);

  final String storeName;
  final String storeAddress;
  final String storePhone;
  final String storeDistance;
  final void Function()? onTapPhone;
  final double? lat;
  final double? long;
  final void Function()? directionPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      child: SizedBox(
        height: 150,
        width: 310,
        child: Card(
          margin: const EdgeInsets.fromLTRB(5, 15, 15, 15),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.store),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              storeName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.pin_drop),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                storeAddress,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(width: 3),
                          Expanded(
                            child: GestureDetector(
                              onTap: onTapPhone,
                              child: Text(
                                storePhone,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                if (lat != null &&
                    long != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        color: purpleColor,
                        onPressed: directionPressed,
                        icon: const Icon(
                          Icons.directions,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        storeDistance,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: purpleColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
