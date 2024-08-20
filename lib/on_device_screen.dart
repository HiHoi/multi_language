import 'package:flutter/material.dart';

class OnDeviceScreen extends StatefulWidget {
  const OnDeviceScreen({super.key});

  @override
  State<OnDeviceScreen> createState() => _OnDeviceScreenState();
}

class _OnDeviceScreenState extends State<OnDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('On Device Translation'),
        ),
      ),
    );
  }
}
