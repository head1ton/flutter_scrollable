import 'package:flutter/material.dart';
import 'package:flutter_scrollable/const/colors.dart';
import 'package:flutter_scrollable/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  GridViewScreen({super.key});

  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridViewScreen',
      body: renderMaxExtent(),
    );
  }

  Widget renderMaxExtent() {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  Widget renderBuilder() {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  Widget renderCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0, // 세로
      mainAxisSpacing: 12.0, // 위 아래
      children: numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);

    return Container(
      height: height ?? 300,
      color: color,
      child: Text(
        index.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
