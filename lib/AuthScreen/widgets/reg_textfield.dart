import 'package:flutter/services.dart';

import '../../app.dart';

class RegTextField extends StatelessWidget {
  const RegTextField({
    Key? key,
    required this.myController,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  final TextEditingController myController;
  final String hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: BrandColors.colorBackground, fontSize: 20),
      cursorColor: BrandColors.colorBackground,
      cursorWidth: 6,
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp(r"\s\b|\b\s"),
        ),
      ],
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        errorStyle: TextStyle(
          fontWeight: AppFontWeight.medium,
          fontSize: Responsive.isDesktop(context) ? 19 : 12,
        ),
        fillColor: BrandColors.colorPrimary.withOpacity(0.3),
        hintStyle: const TextStyle(color: BrandColors.colorBackground),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground, width: 5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorPink),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground, width: 3),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground),
        ),
      ),
    );
  }
}
