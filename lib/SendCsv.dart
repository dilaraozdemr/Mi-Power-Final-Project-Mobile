import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
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
    Get.defaultDialog(content: Center(child: CircularProgressIndicator()),
      title: "Csv Yükleniyor",
      barrierDismissible: false,
    );

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://2659-34-125-25-59.ngrok-free.app/upload'), // NGROK URL'inizi buraya ekleyin
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
      appBar: AppBar(
        title: Text('CSV Uploader'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('Pick CSV File'),
              ),
              SizedBox(height: 20),
              Text(_response),
            ],
          ),
        ),
      ),
    );
  }
}