import 'package:flutter/material.dart';

class ScreenAppBarTitle extends StatelessWidget {
  const ScreenAppBarTitle({required this.Title, super.key});
  final String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

class CrateTextFormField extends StatelessWidget {
  const CrateTextFormField(
      {required this.controller,
      required this.FontSize,
      required this.HintText,
      super.key});

  final double FontSize;

  final String HintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: FontSize),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: HintText,
      ),
    );
  }
}
