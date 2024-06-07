import 'package:analysis_app/pages/GetResults.dart';
import 'package:analysis_app/pages/SendCsv.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    SendCsv(),
    GraphListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Image.asset("assets/icon/file.png", width: 30, height: 30,), text: 'Csv Yükleme'),
              Tab(icon: Image.asset("assets/icon/analytics.png", width: 30, height: 30,), text: 'Analiz Verileri'),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}
