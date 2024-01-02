import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/register/controller.dart';

class FormRegister extends StatelessWidget {
  FormRegister({super.key});
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: Get.height > 750
                ? const EdgeInsets.fromLTRB(15, 40, 15, 0)
                : const EdgeInsets.all(15),
            child: SvgPicture.asset(
              'assets/images/logo_tri_white.svg',
              width: 200,
            ),
          ),
          if (Get.height < 750) const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Form(
                key: controller.formKey.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseFormGroupFieldAuth(
                      label: 'Nama Lengkap',
                      hint: 'Masukkan nama lengkap anda',
                      controller: controller.namaController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama lengkap tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupFieldAuth(
                      label: 'Email',
                      hint: 'Masukkan email anda',
                      helper: controller.username.value == null ||
                              controller.username.value == ''
                          ? null
                          : '${controller.username.value} akan menjadi username anda',
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController.value,
                      onChanged: (value) =>
                          controller.username.value = value?.split('@').first,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        } else {
                          if (!value.isEmail) {
                            return 'Email tidak valid';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupFieldAuth(
                      label: 'No. Telepon (Opsional)',
                      hint: 'Masukkan no. telepon anda',
                      controller: controller.phoneController.value,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isNotEmpty && !value.isPhoneNumber) {
                          return 'No. telepon tidak valid';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupFieldAuth(
                      label: 'Password',
                      hint: 'Masukkan password anda',
                      controller: controller.passwordController.value,
                      obscureText: controller.showPass.value,
                      suffixIcon: IconButton(
                        color: Colors.white,
                        onPressed: () => controller.showPass.value =
                            !controller.showPass.value,
                        icon: Icon(controller.showPass.value
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong';
                        } else {
                          if (value.length < 8) {
                            return 'Password minimal berjumlah 8 karakter';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    BaseFormGroupFieldAuth(
                      label: 'Konfirmasi Password',
                      hint: 'Masukkan kembali password anda',
                      controller: controller.confirmPasswordController.value,
                      obscureText: controller.showConfirmPass.value,
                      suffixIcon: IconButton(
                        color: Colors.white,
                        onPressed: () => controller.showConfirmPass.value =
                            !controller.showConfirmPass.value,
                        icon: Icon(controller.showConfirmPass.value
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Konfirmasi password tidak boleh kosong';
                        } else {
                          if (value !=
                              controller.passwordController.value.text) {
                            return 'Konfirmasi password tidak cocok';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width,
                      child: BaseButton(
                        bgColor: softPurpleColor,
                        fgColor: purpleColor,
                        label: 'Register',
                        onPressed: () {
                          if (controller.formKey.value.currentState!
                              .validate()) {
                            controller.register();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BaseText(
                          text: 'Sudah punya akun? ',
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () => Get.offAndToNamed('/login'),
                          child: const BaseText(
                            text: 'Masuk disini',
                            color: yellowColor,
                            bold: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
