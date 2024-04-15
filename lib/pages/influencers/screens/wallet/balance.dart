import 'package:enfluwence/utills/consts/colors.dart';
import 'package:enfluwence/utills/consts/icons.dart';
import 'package:enfluwence/utills/consts/size.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  const Balance({super.key, this.isSmall = false});
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AColor.blue,
      width: !isSmall ? double.infinity : ASizes.balanceBoxSmallHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AColor.gradinetColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(!isSmall ? ASizes.lg : ASizes.md),
        child: Row(
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Available Balance",
                    style: Theme.of(context).textTheme.labelSmall),
                Text(
                  "N250,215",
                  style: TextStyle().copyWith(
                      fontSize:
                          !isSmall ? ASizes.fontSizeLg : ASizes.fontSizeMd),
                )
              ],
            ),
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: Icon(AIcons.more_horiz))
          ],
        ),
      ),
    );
  }
}
