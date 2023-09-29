import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/custom_bottomsheet.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                tooltip: 'Gratis Ongkir',
                onPressed: () {
                  customBottomSheet(
                    229,
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/free_shipping.svg',
                              width: 80,
                            ),
                            const BaseText(
                              text: 'Gratis Ongkir',
                              size: 16,
                              color: purpleColor,
                              bold: FontWeight.w600,
                            ),
                            const SizedBox(height: 10),
                            const BaseText(
                              text:
                                  'Gratis ongkos kirim dengan ketentuan jarak pengiriman maksimal sesuai kebijakan manajemen Triwarna',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/free_shipping.svg',
                  width: 50,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                tooltip: 'Gratis Konsultasi',
                onPressed: () {
                  customBottomSheet(
                    220,
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/free_consult.svg',
                              width: 80,
                            ),
                            const BaseText(
                              text: 'Gratis Konsultasi',
                              size: 16,
                              color: purpleColor,
                              bold: FontWeight.w600,
                            ),
                            const SizedBox(height: 10),
                            const BaseText(
                              text:
                                  'Gratis konsultasi dengan konsultan Triwarna mengenai pemilihan warna dan jenis cat sesuai kebutuhan pelanggan',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/free_consult.svg',
                  width: 50,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                tooltip: 'Hadiah Menarik',
                onPressed: () {
                  customBottomSheet(
                    220,
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/reward.svg',
                              width: 80,
                            ),
                            const BaseText(
                              text: 'Hadiah Menarik',
                              size: 16,
                              color: purpleColor,
                              bold: FontWeight.w600,
                            ),
                            const SizedBox(height: 10),
                            const BaseText(
                              text:
                                  'Dapatkan berbagai macam hadiah menarik untuk setiap pembelian produk di Triwarna',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/images/reward.svg',
                  width: 50,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: BaseOutlineButtonIcon(
            borderColor: purpleColor,
            icon: Icons.info,
            label: 'Benefit Member',
            onPressed: () {
              Get.toNamed('/benefit');
            },
          ),
        ),
      ],
    );
  }
}
