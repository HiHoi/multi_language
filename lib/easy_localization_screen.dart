import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EasyLocalization extends StatefulWidget {
  const EasyLocalization({super.key, required this.title});

  final String title;

  @override
  State<EasyLocalization> createState() => _EasyLocalizationState();
}

class _EasyLocalizationState extends State<EasyLocalization> {
  int _counter = 0;
  String _selectedLanguage = 'en';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguage = context.locale.toString();
  }

  final List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(child: Text('한국어'), value: 'ko'),
    const DropdownMenuItem(child: Text('English'), value: 'en'),
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
        case 'ko':
          context.setLocale(const Locale('ko'));
          break;
        case 'en':
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
        title: Text(widget.title).tr(args: ['Flutter']),
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
            ).tr(namedArgs: {'name': 'Button'}),
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
