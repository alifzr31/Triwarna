import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
      () => Padding(
        padding: const EdgeInsets.all(15),
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
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController.value,
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
                label: 'Password',
                hint: 'Masukkan password anda',
                controller: controller.passwordController.value,
                obscureText: controller.showPass.value,
                suffixIcon: IconButton(
                  color: Colors.white,
                  onPressed: () =>
                      controller.showPass.value = !controller.showPass.value,
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
                  onPressed: () =>
                      controller.showConfirmPass.value = !controller.showConfirmPass.value,
                  icon: Icon(controller.showConfirmPass.value
                      ? EvaIcons.eye
                      : EvaIcons.eyeOff),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  } else {
                    if (value != controller.passwordController.value.text) {
                      return 'Konfirmasi password tidak cocok';
                    }
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
                  label: 'Register',
                  onPressed: () {
                    if (controller.formKey.value.currentState!.validate()) {
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
    );
    // return Positioned(
    //   bottom: 0,
    //   child: Container(
    //     height: Get.height * 0.75,
    //     width: Get.width,
    //     padding: const EdgeInsets.all(15),
    //     decoration: const BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(50),
    //         topRight: Radius.circular(50),
    //       ),
    //     ),
    //     child: Obx(
    //       () => Column(
    //         children: [
    //           SvgPicture.asset(
    //             'assets/images/logo.svg',
    //             width: 50,
    //           ),
    //           const SizedBox(height: 20),
    //           Expanded(
    //             child: SingleChildScrollView(
    //               child: Form(
    //                 key: controller.formKey.value,
    //                 child: Column(
    //                   children: [
    //                     BaseFormGroupField(
    //                       label: 'Nama Lengkap',
    //                       hint: 'Masukkan nama lengkao anda',
    //                       controller: controller.namaController.value,
    //                       validator: (value) {
    //                         if (value!.isEmpty) {
    //                           return 'Nama lengkap tidak boleh kosong';
    //                         }

    //                         return null;
    //                       },
    //                     ),
    //                     const SizedBox(height: 15),
    //                     BaseFormGroupField(
    //                       label: 'Email',
    //                       hint: 'Masukkan email anda',
    //                       controller: controller.emailController.value,
    //                       keyboardType: TextInputType.emailAddress,
    //                       validator: (value) {
    //                         if (value!.isEmpty) {
    //                           return 'Email tidak boleh kosong';
    //                         } else {
    //                           if (!value.isEmail) {
    //                             return 'Email tidak valid';
    //                           }
    //                         }

    //                         return null;
    //                       },
    //                     ),
    //                     const SizedBox(height: 15),
    //                     BaseFormGroupField(
    //                       label: 'Password',
    //                       hint: 'Masukkan password anda',
    //                       controller: controller.passwordController.value,
    //                       obscureText: controller.showPass.value,
    //                       keyboardType: TextInputType.visiblePassword,
    //                       suffixIcon: IconButton(
    //                         onPressed: () => controller.showPass.value =
    //                             !controller.showPass.value,
    //                         icon: Icon(controller.showPass.value
    //                             ? EvaIcons.eye
    //                             : EvaIcons.eyeOff),
    //                       ),
    //                       validator: (value) {
    //                         if (value!.isEmpty) {
    //                           return 'Password tidak boleh kosong';
    //                         } else {
    //                           if (value.length < 8) {
    //                             return 'Password minimal 8 karakter';
    //                           }
    //                         }

    //                         return null;
    //                       },
    //                     ),
    //                     const SizedBox(height: 15),
    //                     BaseFormGroupField(
    //                       label: 'Konfirmasi Password',
    //                       hint: 'Masukkan ulang password anda',
    //                       controller:
    //                           controller.confirmPasswordController.value,
    //                       obscureText: controller.showConfirmPass.value,
    //                       keyboardType: TextInputType.visiblePassword,
    //                       suffixIcon: IconButton(
    //                         onPressed: () => controller.showConfirmPass.value =
    //                             !controller.showConfirmPass.value,
    //                         icon: Icon(controller.showConfirmPass.value
    //                             ? EvaIcons.eye
    //                             : EvaIcons.eyeOff),
    //                       ),
    //                       validator: (value) {
    //                         if (value!.isEmpty) {
    //                           return 'Konfirmasi password tidak boleh kosong';
    //                         } else {
    //                           if (value !=
    //                               controller.passwordController.value.text) {
    //                             return 'Password tidak cocok';
    //                           }
    //                         }

    //                         return null;
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: Get.width,
    //             child: BaseButton(
    //               bgColor: purpleColor,
    //               fgColor: Colors.white,
    //               label: 'Register',
    //               onPressed: () {
    //                 if (controller.formKey.value.currentState!.validate()) {
    //                   controller.register();
    //                 }
    //               },
    //             ),
    //           ),
    //           const SizedBox(height: 5),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               const BaseText(text: 'Sudah punya akun? '),
    //               GestureDetector(
    //                 onTap: () {
    //                   Get.offAndToNamed('/login');
    //                 },
    //                 child: const BaseText(
    //                   text: 'Masuk disini',
    //                   color: purpleColor,
    //                   bold: FontWeight.w600,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
