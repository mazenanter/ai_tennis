import 'package:flutter/material.dart';

class CustomLocationFormField extends StatelessWidget {
  const CustomLocationFormField(
      {super.key,
      this.onTap,
      required this.controller,
      required this.onChanged});
  final void Function()? onTap;
  final TextEditingController controller;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      onTap: onTap,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Destination',
        filled: true,
        fillColor: Colors.white,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
  }
}
