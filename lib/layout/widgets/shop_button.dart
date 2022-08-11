import 'package:flutter/material.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text!, style: const TextStyle(fontSize: 22)),
      ),
    );
  }
}
