import 'package:flutter/material.dart';

class WeatherWebview extends StatelessWidget {
  const WeatherWebview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Weather Webview'),
        ),
      ),
    );
  }
}
