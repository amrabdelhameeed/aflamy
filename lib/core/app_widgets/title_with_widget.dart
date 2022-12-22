import 'package:flutter/material.dart';

class TitleWithWidget extends StatelessWidget {
  const TitleWithWidget({super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
          child: Text(title, style: Theme.of(context).textTheme.headline4),
        ),
        widget
      ],
    );
  }
}
