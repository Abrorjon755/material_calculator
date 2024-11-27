import 'package:flutter/material.dart';

import '../../../common/utils/extensions/context_extension.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.colors.surfaceContainerHigh,
                context.colors.surfaceContainerLow,
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            border: Border.all(
              color: context.colors.surfaceDim,
            ),
            color: context.colors.surface,
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                offset: const Offset(-20, -20),
                color: context.colors.surfaceContainerLowest,
              ),
              BoxShadow(
                blurRadius: 30,
                offset: const Offset(20, 20),
                color: context.colors.surfaceContainerHighest,
              ),
            ],
          ),
          child: const SizedBox(
            width: double.infinity,
            height: 60,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextFormField(
            onChanged: (value) {
              if (double.tryParse(value) == null) {
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
              }
            },
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            maxLength: 10,
            keyboardType: TextInputType.number,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: context.textTheme.titleLarge?.copyWith(
                color: context.colors.onSurface.withOpacity(.6),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );
  }
}
