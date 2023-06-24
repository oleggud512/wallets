
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late ThemeService thNot;
  
  @override
  void initState() {
    super.initState();
    thNot = context.read<ThemeService>();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Widget'),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text('light'),
            onPressed: () {
              thNot.setCurThemeMode(ThemeMode.light);
            },
          ),
          TextButton(
            child: const Text('dark'),
            onPressed: () {
              thNot.setCurThemeMode(ThemeMode.dark);
            },
          ),
        ],
      )
    );
  }
}