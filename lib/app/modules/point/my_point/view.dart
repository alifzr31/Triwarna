import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/point/components/my_point/header_point.dart';
import 'package:triwarna_rebuild/app/modules/point/components/my_point/point_history.dart';

class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: baseBgScaffold,
        fgColor: purpleColor,
        title: '',
        preferredSize: const Size.fromHeight(kToolbarHeight),
        action: [
          TextButton(
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
            onPressed: () {
              Get.bottomSheet(
                backgroundColor: softPurpleColor,
                SizedBox(
                  height: 300,
                  child: Column(
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
                      Expanded(
                        child: ListView(
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
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const BaseText(text: 'Syarat & Ketentuan'),
          ),
        ],
      ),
      body: Column(
        children: [
          HeaderPoint(),
          PointHistory(),
        ],
      ),
    );
  }
}
