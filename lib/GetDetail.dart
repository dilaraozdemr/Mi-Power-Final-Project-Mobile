import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'analysis_controller.dart';

class GetDetail extends StatefulWidget {
  const GetDetail({Key? key}) : super(key: key);

  @override
  State<GetDetail> createState() => _GetDetailState();
}

class _GetDetailState extends State<GetDetail> {
  AnalysisController controller = Get.put(AnalysisController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: controller.selectedAnalysis.value.imageUrls!.map((url) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CachedNetworkImage(
                imageUrl: url,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          }).toList(),
        ),
      );
    }),);
  }
}
