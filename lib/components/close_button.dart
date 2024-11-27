import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';

class CloseViewButton extends StatelessWidget {
  const CloseViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: ColorPallete.plainWhite,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: ColorPallete.primaryText,
          ),
        ),
      ),
    );
  }
}
