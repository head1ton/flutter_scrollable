import 'package:flutter/material.dart';
import 'package:flutter_scrollable/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  CustomScrollViewScreen({super.key});

  final List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('CustomScrollViewScreen'),
        ),
        renderChildSliverGrid(),
      ],
    ));
  }

  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  SliverList renderChildSliverBuilderList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
    );
  }

  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
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
