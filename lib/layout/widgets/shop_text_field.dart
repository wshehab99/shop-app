import 'package:flutter/material.dart';

class ShopTextField extends StatelessWidget {
  const ShopTextField({
    Key? key,
    this.controller,
    this.type = TextInputType.name,
    this.label,
    this.validate,
    this.prefix,
    this.suffix,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType type;
  final String? label;
  final String? Function(String?)? validate;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
