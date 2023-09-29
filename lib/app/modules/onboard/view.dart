import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            width: 200,
                          ),
                          BaseText(text: 'On Board ${index + 1}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.ac_unit),
                Icon(Icons.ac_unit),
                IconButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(yellowColor)),
                  onPressed: () async {
                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.setBool('opened', true);
                    Get.offAllNamed('/dashboard');
                  },
                  icon: Icon(Icons.ac_unit),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
