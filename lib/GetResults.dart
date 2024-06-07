
import 'package:analysis_app/AnalysisResponseModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'analysis_controller.dart';
class GraphListScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _graphsStream =
  FirebaseFirestore.instance.collection('graphs').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphs'),
      ),
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
              return GraphCard(analysisResponseModel: analysis[index]);
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

  GraphCard({required this.analysisResponseModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.selectedAnalysis.value = analysisResponseModel;
        Get.toNamed("/detail");
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                analysisResponseModel.title ??"",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}