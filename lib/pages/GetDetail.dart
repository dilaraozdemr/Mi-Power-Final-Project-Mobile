import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../controller/analysis_controller.dart';

class GetDetail extends StatefulWidget {
  const GetDetail({Key? key}) : super(key: key);

  @override
  State<GetDetail> createState() => _GetDetailState();
}

class _GetDetailState extends State<GetDetail> {
  AnalysisController controller = Get.put(AnalysisController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(title: Text(controller.selectedAnalysis.value.title ?? ""), backgroundColor: Color(0xffEEEEEE),),
      body: Obx(() {
      return SingleChildScrollView(
        child: Column(
          children:
          controller.selectedAnalysis.value.imageUrls!.map((url) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CachedNetworkImage(
                  imageUrl: url,
                  placeholder: (context, url) => Center(child: Lottie.asset("assets/lottie/progressIndicator.json", width: 200, height: 200)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }),);
  }
}
