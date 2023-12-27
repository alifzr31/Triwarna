import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/core/values/custom_bottomsheet.dart';
import 'package:triwarna_rebuild/app/modules/point/controller.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/widgets/header_point.dart';
import 'package:triwarna_rebuild/app/modules/point/my_point/widgets/list_prize.dart';

class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Poin',
        preferredSize: const Size.fromHeight(kToolbarHeight),
        action: [
          IconButton(
            onPressed: () {
              customBottomSheet(
                260,
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Row(
                        children: [
                          Icon(
                            EvaIcons.file,
                            color: purpleColor,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          BaseText(
                            text: 'Syarat & Ketentuan',
                            size: 22,
                            color: purpleColor,
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      physics: const ClampingScrollPhysics(),
                      children: const [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(text: '1. '),
                            Expanded(
                              child: BaseText(
                                  text:
                                      'Poin yang dapat ditukarkan dengan kelipatan 50'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(text: '2. '),
                            Expanded(
                              child: BaseText(
                                  text:
                                      'Saldo yang diambil tidak boleh melebihi poin aktif Anda'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(text: '3. '),
                            Expanded(
                              child: BaseText(
                                  text:
                                      'Batas waktu pencairan saldo adalah 1 bulan'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(text: '4. '),
                            Expanded(
                              child: BaseText(
                                  text:
                                      'Apabila saldo yang sudah dicairkan tidak terpakai maka voucher tidak dapat digunakan (Hangus)'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(text: '5. '),
                            Expanded(
                              child: BaseText(
                                  text:
                                      'Voucher yang hangus tidak akan mengembalikan poin Anda'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: PointBody(),
    );
  }
}

class PointBody extends StatelessWidget {
  PointBody({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPoint,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height * 0.9,
          width: Get.width,
          child: Column(
            children: [
              HeaderPoint(),
              ListPrize(),
            ],
          ),
        ),
      ),
    );
  }
}
