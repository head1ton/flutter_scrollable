import 'package:flutter/material.dart';
import 'package:flutter_scrollable/layout/main_layout.dart';
import 'package:flutter_scrollable/screen/list_view_screen.dart';
import 'package:flutter_scrollable/screen/single_child_scroll_view_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final screens = [
    ScreenModel(
        builder: (_) => SingleChildScrollViewScreen(),
        name: 'SingleChildScrollViewScreen'),
    ScreenModel(builder: (_) => ListViewScreen(), name: 'ListViewScreen'),
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screens
              .map(
                (screen) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: screen.builder),
                    );
                  },
                  child: Text(screen.name),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
