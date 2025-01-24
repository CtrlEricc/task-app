import 'package:flutter/material.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String hintText;
  final T? value;
  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  const CustomDropdownFormField({
    required this.hintText,
    required this.value,
    required this.validator,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      isDense: true,
      value: value,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      items: items,
      onChanged: onChanged,
    );
  }
}
