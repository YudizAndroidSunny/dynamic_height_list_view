import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  GridViewExample({super.key});

  final List<Color> colors = List.generate(
    100,
    (index) => Color((index * 0xFFFFFF ~/ 100) << 0).withOpacity(1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Height Grid View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DynamicHeightGridView(
          shrinkWrap: true,
          itemCount: 100,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          builder: (context, index) {
            return SizedBox(
              height: 200,
              child: ColoredBox(
                color: colors[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
