import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/style/primary_text.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem(
      {Key? key,
      required this.icon,
      required this.text,
      required this.hasNavigation})
      : super(key: key);

  // const ProfileListItem({
  //   // Key key,
  //   required this.icon,
  //   required this.text,
  //   this.hasNavigation = true,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10 * 5.5,
      margin: const EdgeInsets.symmetric(
        horizontal: 10 * 4,
      ).copyWith(
        bottom: 10 * 2,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10 * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 10 * 2.5,
          ),
          const SizedBox(width: 10 * 1.5),
          PrimaryText(text: text, size: 20),
          const Spacer(),
          if (hasNavigation)
            const Icon(
              Icons.keyboard_arrow_right,
              size: 10 * 2.5,
            ),
        ],
      ),
    );
  }
}
