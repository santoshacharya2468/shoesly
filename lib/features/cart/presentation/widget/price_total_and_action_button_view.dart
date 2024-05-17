import 'package:flutter/material.dart';
import 'package:shoesly/core/widget/app_outlined_text_button.dart';

class PriceTotalAndActionButtonView extends StatelessWidget {
  final String buttonText;
  final String title;
  final String subTitle;
  final VoidCallback onButtonPressed;
  const PriceTotalAndActionButtonView(
      {super.key,
      required this.buttonText,
      required this.title,
      required this.subTitle,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3)), // changes position of shadow
      ]),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          const Spacer(),
          AppOutlinedTextButton(text: buttonText, onPressed: onButtonPressed)
        ],
      ),
    );
  }
}
