import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/voucher/controller.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: 'Lacak Hadiah Voucher',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: TrackingBody(),
    );
  }
}

class TrackingBody extends StatefulWidget {
  const TrackingBody({super.key});

  @override
  State<TrackingBody> createState() => _TrackingBodyState();
}

class _TrackingBodyState extends State<TrackingBody> {
  final controller = Get.find<VoucherController>();

  @override
  void initState() {
    controller.fetchTracking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.trackingLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: controller.tracking.length,
              itemBuilder: (context, index) {
                final tracking = controller.tracking[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: BaseText(text: tracking.status ?? ''),
                  ),
                );
              },
            ),
    );
  }
}
