import 'package:flutter/material.dart';
import 'package:task_app/ui/core/themes/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final bool? isLoading;
  final void Function()? onPressed;

  const CustomElevatedButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color393433),
        onPressed: isLoading! ? null : onPressed,
        child: isLoading!
            ? CircularProgressIndicator(color: colorF3EFEE)
            : Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
