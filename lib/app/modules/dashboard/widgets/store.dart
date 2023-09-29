import 'package:flutter/material.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/store/body_store.dart';

class StoreTab extends StatelessWidget {
  const StoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyStore(),
    );
  }
}
