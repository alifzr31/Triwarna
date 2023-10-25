import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/account/header_account.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/account/menu_account.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/header_dashboard.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: softPurpleColor,
        title: '',
        preferredSize: Size.zero,
      ),
      body: Get.width <= 442 ? normalPhone() : largePhone(),
    );
  }

  Widget normalPhone() {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        const HeaderDashboard(
          child: BaseText(
            text: 'Akun',
            size: 26,
            color: purpleColor,
            bold: FontWeight.w600,
          ),
        ),
        HeaderAccount(),
        MenuAccount(),
      ],
    );
  }

  Widget largePhone() {
    return Column(
      children: [
        const HeaderDashboard(
          child: BaseText(
            text: 'Akun',
            size: 26,
            color: purpleColor,
            bold: FontWeight.w600,
          ),
        ),
        HeaderAccount(),
        MenuAccount(),
      ],
    );
  }
}
