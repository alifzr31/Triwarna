import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/shopping/shopping_history/widgets/shoppinghistory_body.dart';

class ShoppingHistoryPage extends StatelessWidget {
  const ShoppingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: purpleColor,
        fgColor: Colors.white,
        title: 'Riwayat Belanja',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ShoppingHistoryBody(),
    );
  }
}
