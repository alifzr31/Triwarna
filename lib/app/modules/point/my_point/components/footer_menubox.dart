import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class FooterMenuBox extends StatelessWidget {
  const FooterMenuBox({
    Key? key,
    this.showHistoryButton = false,
  }) : super(key: key);

  final bool showHistoryButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Visibility(
            visible: showHistoryButton,
            child: TextButton.icon(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                iconColor: MaterialStatePropertyAll(purpleColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Get.toNamed('/historyPoint');
              },
              icon: const Icon(Icons.history),
              label: const BaseText(
                text: 'Riwayat Poin',
                color: Colors.black,
              ),
            ),
          ),
        TextButton.icon(
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            iconColor: MaterialStatePropertyAll(purpleColor),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
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
          icon: const Icon(Icons.help_outline),
          label: const BaseText(
            text: 'Tentang Poin',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
