import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  ListViewExample({super.key});

  final List<Color> colors = List.generate(
    100,
    (index) => Color((index * 0xFFFFFF ~/ 100) << 0).withOpacity(1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Height List View'),
      ),
      body: DynamicHeightListView<int>(
        items: List.generate(10, (index) => index),
        itemPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        itemBuilder: (context, item) => Card(
          child: SizedBox(
            height: 40,
            width: 100,
            child: ColoredBox(
              color: colors[item],
            ),
          ),
        ),
      ),
    );
  }
}
