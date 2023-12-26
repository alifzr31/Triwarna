import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:triwarna_rebuild/app/components/base_appbar.dart';
import 'package:triwarna_rebuild/app/components/base_nodata.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/contents/controller.dart';
import 'package:url_launcher/url_launcher.dart';

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
        bgColor: purpleColor,
        fgColor: Colors.white,
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
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                    ),
                                  );
                          },
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
                              image: 'logo.svg',
                              title: 'Ups sepertinya terjadi kesalahan',
                              subtitle: '',
                              onPressed: () {},
                            );
                          },
                          renderMode: RenderMode.column,
                          onTapUrl: (value) async {
                            final url = Uri.parse(value);
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
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
