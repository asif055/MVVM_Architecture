import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_archit/res/color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
  });

  final String title;
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
