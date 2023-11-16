import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/widgets/deleteaccount_body.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Hapus Akun',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: DeleteAccountBody(),
    );
  }
}
