import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_listtile.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/components/account/logout_dialog.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class MenuAccount extends StatelessWidget {
  MenuAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Get.width <= 442 ? normalPhone(context) : largePhone(context);
  }

  Widget normalPhone(BuildContext context) {
    return SizedBox(
      height: 500,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Material(
          color: Colors.white,
          child: Obx(
            () => controller.token.value == null
                ? const Center(
                    child: BaseText(
                      text: 'Anda Belum Melakukan Log In',
                      size: 16,
                      color: purpleColor,
                      bold: FontWeight.w600,
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            BaseListTile(
                              leading: SvgPicture.asset(
                                'assets/images/shopping_history.svg',
                                width: 30,
                              ),
                              title: 'Riwayat Belanja',
                              subtitle: 'Riwayat belanjaan anda di triwarna',
                              onTap: () {
                                Get.toNamed('/shoppingHistory');
                              },
                            ),
                            BaseListTile(
                              leading: const Icon(
                                Icons.lock,
                                size: 30,
                                color: purpleColor,
                              ),
                              title: controller.profile.value?.pin == null
                                  ? 'Buat PIN'
                                  : 'Ganti PIN',
                              subtitle: controller.profile.value?.pin == null
                                  ? 'Buat PIN untuk memberikan keamanan akun'
                                  : 'Ganti PIN anda secara berkala sangat disarankan',
                              onTap: () {
                                if (controller.profile.value?.pin == null) {
                                  Get.toNamed('/createPin');
                                } else {
                                  Get.toNamed('/changePin');
                                }
                              },
                            ),
                            BaseListTile(
                              leading: const Icon(
                                Icons.password,
                                size: 30,
                                color: purpleColor,
                              ),
                              title: 'Ganti Password',
                              subtitle:
                                  'Ganti password anda secara berkala sangat disarankan',
                              onTap: () {
                                Get.toNamed('/changePass');
                              },
                            ),
                            BaseListTile(
                              leading: const Icon(
                                EvaIcons.headphones,
                                size: 30,
                                color: purpleColor,
                              ),
                              title: 'Hubungi Kami',
                              subtitle:
                                  'Hubungi kami apabila terdapat kesalahan sistem',
                              onTap: () {},
                            ),
                            BaseListTile(
                              leading: const Icon(
                                EvaIcons.trash2,
                                size: 30,
                                color: Colors.red,
                              ),
                              title: 'Hapus Akun',
                              subtitle:
                                  'Hapus akun akan membuatmu berhenti menjadi member Triwarna',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: BaseButtonIcon(
                                bgColor: Colors.red.shade300,
                                fgColor: Colors.white,
                                ovColor: Colors.red.shade800.withOpacity(0.4),
                                icon: Icons.power_settings_new,
                                label: 'Log Out',
                                onPressed: () {
                                  logoutDialog(context);
                                },
                              ),
                            ),
                            BaseText(
                              text:
                                  '${controller.appName.value} v${controller.version.value}',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget largePhone(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Material(
          color: Colors.white,
          child: Obx(
            () => controller.token.value == null
                ? const Center(
                    child: BaseText(
                      text: 'Anda Belum Melakukan Log In',
                      size: 16,
                      color: purpleColor,
                      bold: FontWeight.w600,
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            BaseListTile(
                              leading: SvgPicture.asset(
                                'assets/images/shopping_history.svg',
                                width: 30,
                              ),
                              title: 'Riwayat Belanja',
                              subtitle: 'Riwayat belanjaan anda di triwarna',
                              onTap: () {
                                Get.toNamed('/shoppingHistory');
                              },
                            ),
                            BaseListTile(
                              leading: const Icon(
                                EvaIcons.lock,
                                size: 30,
                                color: purpleColor,
                              ),
                              title: controller.profile.value?.pin == null
                                  ? 'Buat PIN'
                                  : 'Ganti PIN',
                              subtitle: controller.profile.value?.pin == null
                                  ? 'Buat PIN untuk memberikan keamanan akun'
                                  : 'Ganti PIN anda secara berkala sangat disarankan',
                              onTap: () {
                                if (controller.profile.value?.pin == null) {
                                  Get.toNamed('/createPin');
                                } else {
                                  Get.toNamed('/changePin');
                                }
                              },
                            ),
                            BaseListTile(
                              leading: const Icon(
                                Icons.password,
                                size: 30,
                                color: purpleColor,
                              ),
                              title: 'Ganti Password',
                              subtitle:
                                  'Ganti password anda secara berkala sangat disarankan',
                              onTap: () {
                                Get.toNamed('/changePass');
                              },
                            ),
                            BaseListTile(
                              leading: const Icon(
                                EvaIcons.headphones,
                                size: 30,
                                color: purpleColor,
                              ),
                              title: 'Hubungi Kami',
                              subtitle:
                                  'Hubungi kami apabila terdapat kesalahan sistem',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: BaseButtonIcon(
                                bgColor: Colors.red.shade300,
                                fgColor: Colors.white,
                                ovColor: Colors.red.shade800.withOpacity(0.4),
                                icon: Icons.power_settings_new,
                                label: 'Log Out',
                                onPressed: () async {
                                  logoutDialog(context);
                                },
                              ),
                            ),
                            BaseText(
                              text:
                                  '${controller.appName.value} v${controller.version.value}',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
