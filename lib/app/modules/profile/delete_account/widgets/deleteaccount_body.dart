import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/controller.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/widgets/deleteaccount_form.dart';
import 'package:triwarna_rebuild/app/modules/profile/delete_account/widgets/deleteaccount_header.dart';

class DeleteAccountBody extends StatelessWidget {
  DeleteAccountBody({super.key});
  final controller = Get.find<DeleteAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Column(
              children: [
                DeleteAccountHeader(),
                DeleteAccountForm(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: purpleColor,
                    fgColor: Colors.white,
                    label: controller.sent.value ? 'Submit' : 'Kirim Kode OTP',
                    onPressed: () {
                      if (controller.sent.value) {
                        if (controller.formKey.value.currentState!.validate()) {
                          controller.deleteAccount();
                        }
                      } else {
                        controller.deleteAccountOtp();
                      }
                    },
                  ),
                ),
                // if (controller.sent.value) const SizedBox(height: 5),
                if (controller.sent.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BaseText(text: 'Tidak menerima email? '),
                      GestureDetector(
                        onTap: controller.deleteAccountOtp,
                        child: const BaseText(
                          text: 'Kirim Ulang',
                          color: purpleColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
