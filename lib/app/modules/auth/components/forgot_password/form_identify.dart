import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/forgot_password/identify/controller.dart';

class FormIdentify extends StatelessWidget {
  FormIdentify({super.key});
  final controller = Get.find<IdentifyController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.952,
        width: Get.width,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BaseText(
                    text: 'Lupa Password',
                    size: 20,
                    bold: FontWeight.w600,
                    color: Colors.white,
                  ),
                  const BaseText(
                    text:
                        'Masukkan username/email anda dengan benar untuk mereset password',
                    bold: FontWeight.w600,
                    color: Colors.white70,
                  ),
                  controller.showAlert.value
                      ? Container(
                          height: 50,
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                size: 30,
                                color: Colors.blue.shade800,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: BaseText(
                                  text: controller.status.value == 0
                                      ? 'Akun tidak ditemukan'
                                      : 'Permintaan reset password sudah terkirim ke email anda',
                                  color: Colors.blue.shade800,
                                  bold: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(height: 40),
                  BaseFormGroupFieldAuth(
                    label: 'Username/Email',
                    hint: 'Masukkan username/email anda',
                    controller: controller.userController.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username/email tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: softPurpleColor,
                      fgColor: purpleColor,
                      label: 'Cek Akun',
                      onPressed: () {
                        if (controller.formKey.value.currentState!.validate()) {
                          controller.identifyAccount();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
