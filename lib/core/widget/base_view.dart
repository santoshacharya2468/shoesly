import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<Widget>? actions;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const BaseView(
      {super.key,
      required this.title,
      this.titleStyle,
      this.actions,
      required this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12), child: body),
      appBar: AppBar(
        title: Text(
          title,
          style: titleStyle,
        ),
        backgroundColor: Colors.white,
        actions: actions,
      ),
    );
  }
}
