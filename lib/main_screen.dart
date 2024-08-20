import 'package:flutter/material.dart';
import 'package:multi_language/easy_localization_screen.dart';
import 'package:multi_language/on_device_screen.dart';
import 'package:multi_language/weather_webview.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            EasyLocalization(
              title: 'Flutter Demo Home Page',
            ),
            WeatherWebview(),
            OnDeviceScreen(),
          ],
          controller: _tabController,
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.settings)),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
