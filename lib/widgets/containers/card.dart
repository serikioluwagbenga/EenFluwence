import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:enfluwence/utills/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ACard extends StatelessWidget {
  const ACard(
      {super.key,
      required this.child,
      this.width = double.infinity,
      this.backgroundColor});
  final Widget child;
  final double width;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: ASizes.md),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor ??
                AHelperFunctions.getCardBackgroundColor(context),
            borderRadius: BorderRadius.circular(ASizes.borderRadiusLg),
          ),
          child: Padding(
            padding: const EdgeInsets.all(ASizes.md),
            child: child,
          ),
        )
      ],
    );
  }
}