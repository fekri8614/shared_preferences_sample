import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDemo extends StatefulWidget {
  const LocalStorageDemo({super.key, required this.title});

  final String title;

  @override
  State<LocalStorageDemo> createState() => _MyLocalStorageDemoState();
}

class _MyLocalStorageDemoState extends State<LocalStorageDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  void _resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      prefs.remove('counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
