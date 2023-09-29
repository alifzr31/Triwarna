import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:triwarna_rebuild/app/components/base_button.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupdropdown.dart';
import 'package:triwarna_rebuild/app/components/base_formgroupfield.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/components/base_textarea.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/profile/controller.dart';

class FormEditProfile extends StatelessWidget {
  FormEditProfile({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(
                () => Form(
                  key: controller.formKeyEditProfil.value,
                  child: Column(
                    children: [
                      BaseFormGroupField(
                        label: 'Nama Lengkap',
                        hint: 'Masukkan nama lengkap anda',
                        controller: controller.namaController.value,
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'Username',
                        controller: controller.usernameController.value,
                        readOnly: true,
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'Email',
                        controller: controller.emailController.value,
                        readOnly: true,
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'Tempat Lahir',
                        hint: 'Masukkan tempat lahir anda',
                        controller: controller.tempatLahirController.value,
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'Tanggal Lahir',
                        hint: 'Masukkan tanggal lahir anda',
                        controller: controller.tglLahirController.value,
                        readOnly: true,
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            locale: LocaleType.id,
                            currentTime: controller.selectTglLahir.value == null
                                ? DateTime.now()
                                : controller.selectTglLahir.value,
                            onChanged: (time) {
                              final formatter = DateFormat('dd MMMM yyyy');
                              final selectTime = formatter.format(time);
                              controller.selectTglLahir.value = time;
                              controller.tglLahirController.value.text =
                                  selectTime;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupDropdown(
                        label: 'Jenis Kelamin',
                        hint: 'Pilih jenis kelamin anda',
                        value: controller.selectJk.value == null
                            ? null
                            : controller.selectJk.value,
                        items: controller.jenisKelamin
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: BaseText(text: e),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            controller.selectJk.value = value.toString(),
                      ),
                      const SizedBox(height: 15),
                      BaseTextArea(
                        label: 'Alamat',
                        hint: 'Masukkan alamat rumah anda',
                        controller: controller.alamatController.value,
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: BaseText(
                          text: 'Kelurahan/Desa',
                          bold: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TypeAheadFormField(
                        hideSuggestionsOnKeyboardHide: false,
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: controller.kelurahanController.value,
                          decoration: InputDecoration(
                            hintText: 'Kelurahan/Desa',
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan kelurahan/desa anda';
                          }

                          return null;
                        },
                        onSuggestionSelected: (suggestion) {
                          controller.selectKelurahan.value =
                              suggestion.kdKelurahan ?? '';
                          controller.kelurahanController.value.text =
                              suggestion.namaKelurahan.toString().capitalize ??
                                  '';
                        },
                        suggestionsCallback: (pattern) => controller.kelurahan
                            .where((e) => e.namaKelurahan
                                .toString()
                                .toLowerCase()
                                .contains(pattern))
                            .toList(),
                        itemBuilder: (context, suggest) {
                          return ListTile(
                            title: BaseText(
                                text: suggest.namaKelurahan
                                        .toString()
                                        .capitalize ??
                                    ''),
                            subtitle: BaseText(
                                text: suggest.namaKecamatan
                                        .toString()
                                        .capitalize ??
                                    ''),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupDropdown(
                        label: 'Agama',
                        hint: 'Pilih agama anda',
                        value: controller.selectAgama.value == null
                            ? null
                            : controller.selectAgama.value,
                        items: controller.agama
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: BaseText(text: e),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            controller.selectAgama.value = value.toString(),
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupDropdown(
                        label: 'Jenis Identitas',
                        hint: 'Pilih jenis identitas anda',
                        value: controller.selectIdentitas.value == null
                            ? null
                            : controller.selectIdentitas.value,
                        items: controller.identitas
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: BaseText(text: e),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            controller.selectIdentitas.value = value.toString(),
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'No, Identitas',
                        hint: 'Masukkan no. identitan anda',
                        controller: controller.noIndentitasController.value,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupDropdown(
                        label: 'Pendidikan Terakhir',
                        hint: 'Pilih pendidikan terakhir anda',
                        value: controller.selectPendidikan.value == null
                            ? null
                            : controller.selectPendidikan.value,
                        items: controller.pendidikan
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: BaseText(text: e),
                                ))
                            .toList(),
                        onChanged: (value) => controller
                            .selectPendidikan.value = value.toString(),
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupDropdown(
                        label: 'Jenis Pekerjaan',
                        hint: 'Pilih jenis pekerjaan anda',
                        value: controller.selectPekerjaan.value == null
                            ? null
                            : controller.selectPekerjaan.value,
                        items: controller.pekerjaan
                            .map((e) => DropdownMenuItem<String>(
                                  value: e.id,
                                  child: BaseText(text: e.nama),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            controller.selectPekerjaan.value = value.toString(),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: BaseText(
                          text: 'Status Pernikahan',
                          bold: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      RadioGroup.builder(
                        direction: Axis.horizontal,
                        groupValue: controller.selectStatus.value,
                        textStyle: const TextStyle(fontSize: 16),
                        activeColor: purpleColor,
                        horizontalAlignment: MainAxisAlignment.spaceBetween,
                        onChanged: (value) {
                          controller.selectStatus.value = value;
                        },
                        items: controller.status,
                        itemBuilder: (value) {
                          return RadioButtonBuilder(
                            value.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(15),
            child: BaseButton(
              bgColor: purpleColor,
              fgColor: Colors.white,
              label: 'Edit Profil',
              onPressed: () {
                controller.editProfile();
              },
            ),
          )
        ],
      ),
    );
  }
}
