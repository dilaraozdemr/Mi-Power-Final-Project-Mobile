import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class SendCsv extends StatefulWidget {
  @override
  _SendCsvState createState() => _SendCsvState();
}

class _SendCsvState extends State<SendCsv> {
  String _response = '';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      await _uploadFile(file);
    } else {
      setState(() {
        _response = 'No file selected';
      });
    }
  }

  Future<void> _uploadFile(File file) async {
    Get.defaultDialog(content: Center(child: Lottie.asset("assets/lottie/progressIndicator.json", width: 40, height: 40,),),
      title: "Csv Yükleniyor",
      barrierDismissible: false,
    );

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://c149-35-224-82-94.ngrok-free.app/upload'), // NGROK URL'inizi buraya ekleyin
    );
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: basename(file.path),
      ),
    );

    var res = await request.send();
    var response = await http.Response.fromStream(res);
    Get.back(); // Close the dialog

    if (response.statusCode == 200) {
      setState(() {
        _response = "CSV Başarıyla Yüklendi Analiz Sonuçları İçin Bekleyiniz";
      });
    } else {
      setState(() {
        _response = response.reasonPhrase.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Text('CSV Yükleme Sayfası', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Color(0xff050C9C)),)),
              Lottie.asset("assets/lottie/csv_upload.json",height: 400, width: 400),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff003285),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                  child: Text('CSV dosyasını seçiniz', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                ),
              ),
              const SizedBox(height: 20),
              Text(_response),
            ],
          ),
        ),
      ),
    );
  }
}