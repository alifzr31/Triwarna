import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/auth/widgets/login/controller.dart';

class FormLogin extends StatelessWidget {
  FormLogin({super.key});
  final controller = Get.find<LoginController>();

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
                label: 'Username/Email',
                hint: 'Masukkan username atau email anda',
                controller: controller.usernameController.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username/email tidak boleh kosong';
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
                  }
                  
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed('/identify'),
                  child: const BaseText(
                    text: 'Lupa Password?',
                    color: yellowColor,
                    bold: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: Get.width,
                child: BaseButton(
                  bgColor: softPurpleColor,
                  fgColor: purpleColor,
                  label: 'Log In',
                  onPressed: () {
                    if (controller.formKey.value.currentState!.validate()) {
                      controller.login();
                    }
                  },
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BaseText(
                    text: 'Belum punya akun? ',
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () => Get.offAndToNamed('/register'),
                    child: const BaseText(
                      text: 'Daftar disini',
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
    //     height: Get.height * 0.5,
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
    //             child: Column(
    //               children: [
    //                 Form(
    //                   key: controller.formKey.value,
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       BaseFormGroupField(
    //                         label: 'Username',
    //                         hint: 'Masukkan username anda',
    //                         controller:
    //                             controller.usernameController.value,
    //                         validator: (value) {
    //                           if (value!.isEmpty) {
    //                             return 'Username tidak boleh kosong';
    //                           }

    //                           return null;
    //                         },
    //                       ),
    //                       const SizedBox(height: 15),
    //                       BaseFormGroupField(
    //                         label: 'Password',
    //                         hint: 'Masukkan password anda',
    //                         controller:
    //                             controller.passwordController.value,
    //                         obscureText: controller.showPass.value,
    //                         keyboardType: TextInputType.visiblePassword,
    //                         suffixIcon: IconButton(
    //                           onPressed: () => controller.showPass
    //                               .value = !controller.showPass.value,
    //                           icon: Icon(
    //                             controller.showPass.value
    //                                 ? EvaIcons.eye
    //                                 : EvaIcons.eyeOff,
    //                           ),
    //                         ),
    //                         validator: (value) {
    //                           if (value!.isEmpty) {
    //                             return 'Password tidak boleh kosong';
    //                           }

    //                           return null;
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 const SizedBox(height: 15),
    //                 Align(
    //                   alignment: Alignment.centerRight,
    //                   child: GestureDetector(
    //                     onTap: () {},
    //                     child: const BaseText(
    //                       text: 'Lupa Password?',
    //                       color: purpleColor,
    //                       bold: FontWeight.w600,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             width: Get.width,
    //             child: BaseButton(
    //               bgColor: purpleColor,
    //               fgColor: Colors.white,
    //               label: 'Log In',
    //               onPressed: () {
    //                 if (controller.formKey.value.currentState!
    //                     .validate()) {
    //                   controller.login();
    //                 }
    //               },
    //             ),
    //           ),
    //           const SizedBox(height: 5),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               const BaseText(text: 'Belum punya akun? '),
    //               GestureDetector(
    //                 onTap: () {
    //                   Get.offAndToNamed('/register');
    //                 },
    //                 child: const BaseText(
    //                   text: 'Daftar disini',
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
