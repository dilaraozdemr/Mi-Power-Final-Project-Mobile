import 'package:analysis_app/model/AnalysisResponseModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/analysis_controller.dart';
class GraphListScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _graphsStream =
  FirebaseFirestore.instance.collection('graphs').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _graphsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          List<AnalysisResponseModel> analysis = snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return AnalysisResponseModel.fromFirestore(data);
          }).toList();

          return ListView.builder(
            itemCount: analysis.length,
            itemBuilder: (context, index) {
              return GraphCard(analysisResponseModel: analysis[index],);
            },
          );
        },
      ),
    );
  }
}

class GraphCard extends StatelessWidget {
  AnalysisController controller = Get.put(AnalysisController());
  final AnalysisResponseModel analysisResponseModel;
  final Color? colors;

  GraphCard({required this.analysisResponseModel, this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: GestureDetector(
        onTap: (){
          controller.selectedAnalysis.value = analysisResponseModel;
          Get.toNamed("/detail");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    analysisResponseModel.title ??"",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color:Colors.black),
                  ),
                ),
                const SizedBox(width: 20),
                Icon(Icons.arrow_forward_ios, size: 20,)
              ],
            ),
          ),
        )
      ),
    );
  }
}