import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

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
        hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
        label: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryClr),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Get.isDarkMode ? Colors.white : darkGreyClr),
          borderRadius: BorderRadius.circular(4),
        ),
      ));
}
