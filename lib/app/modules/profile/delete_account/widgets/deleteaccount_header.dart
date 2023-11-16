import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/controller.dart';

class DeleteAccountHeader extends StatelessWidget {
  DeleteAccountHeader({super.key});
  final controller = Get.find<DeleteAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const BaseText(
              text:
                  'Apakah Anda yakin ingin menghapus akun Anda? Tindakan ini tidak dapat dibatalkan dan semua data Anda akan dihapus secara permanen.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            BaseText(
              text: controller.sent.value
                  ? 'OTP sudah dikirim ke email'
                  : 'OTP akan dikirim ke email',
              size: 12,
              color: Colors.grey.shade600,
            ),
            BaseText(
              text: controller.email.value ?? '',
              bold: FontWeight.w600,
            ),
            if (controller.sent.value) const SizedBox(height: 5),
            if (controller.sent.value)
              const BaseText(
                text: 'Silahkan cek email anda',
                size: 12,
                color: Colors.red,
              ),
          ],
        ),
      ),
    );
  }
}
