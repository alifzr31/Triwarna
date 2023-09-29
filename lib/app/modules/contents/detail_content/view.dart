import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/contents/controller.dart';

class DetailContentPage extends StatefulWidget {
  const DetailContentPage({super.key});

  @override
  State<DetailContentPage> createState() => _DetailContentPageState();
}

class _DetailContentPageState extends State<DetailContentPage> {
  final controller = Get.find<ContentsController>();
  final args = Get.arguments;

  @override
  void initState() {
    if (args == null) {
      controller.title.value = controller.title.value;
      controller.slug.value = controller.slug.value;
      controller.date.value = controller.date.value;
    } else {
      controller.title.value = args[0];
      controller.slug.value = args[1];
      controller.date.value = args[2];
    }
    controller.fetchDetailContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: softPurpleColor,
        fgColor: purpleColor,
        title: controller.title.value ?? '',
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: Obx(
        () => controller.detailContentLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    height: 350,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.network(
                          '${ApiUrl.baseStorageUrl}/contents/${controller.detailContent.value?.featuredImage}',
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BaseText(
                                    text: controller
                                            .detailContent.value?.category
                                            .toString()
                                            .capitalize ??
                                        '',
                                    bold: FontWeight.w500,
                                    color: controller.detailContent.value
                                                ?.category ==
                                            'event'
                                        ? yellowColor
                                        : purpleColor,
                                  ),
                                  BaseText(
                                    text:
                                        'Author: ${controller.detailContent.value?.authorId.toString().capitalize}',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            BaseText(text: controller.date.value ?? ''),
                          ],
                        ),
                        const SizedBox(height: 20),
                        HtmlWidget(
                          controller.detailContent.value?.content ?? '',
                          onErrorBuilder: (context, element, error) {
                            return BaseNoData(
                              label: 'Ups sepertinya terjadi kesalahan',
                              labelButton: 'Refresh Konten',
                              onPressed: () {},
                            );
                          },
                          renderMode: RenderMode.column,
                          onTapUrl: (value) {
                            print(value);
                            return true;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
