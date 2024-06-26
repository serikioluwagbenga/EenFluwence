import 'package:flutter/material.dart';

class TitleP extends StatelessWidget {
  const TitleP(
      {super.key, required this.title, this.paragraph, this.titleStyle});
  final String title;
  final String? paragraph;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: titleStyle ?? Theme.of(context).textTheme.titleMedium),
        paragraph != null
            ? Text(
                paragraph!,
                style: Theme.of(context).textTheme.bodySmall,
              )
            : const SizedBox(),
      ],
    );
  }
}
