import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _selectedLanguage = '2';

  final List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(child: Text('한국어'), value: '1'),
    const DropdownMenuItem(child: Text('영어'), value: '2'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeLanguage(String? value) {
    setState(() {
      _selectedLanguage = value!;
      switch (value) {
        case '1':
          context.setLocale(const Locale('ko'));
          break;
        case '2':
          context.setLocale(const Locale('en'));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title).tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton(
                value: _selectedLanguage,
                items: items,
                onChanged: _changeLanguage,
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ).tr(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
