import 'package:flutter/material.dart';

Widget inputField(
    {TextEditingController? controller,
    Widget? label,
    prefixIcon,
    suffixIcon,
    String? hintText,
    TextInputType? keyboardType,
    bool? enabled,
    readOnly}) {
  return TextFormField(
      readOnly: readOnly ?? false,
      enableInteractiveSelection: true,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        label: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ));
}
