import 'package:flutter/material.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:provider/provider.dart';

import '../provider/themeprovider.dart';
import '../style/color.dart';

class SpecialTextfield extends StatelessWidget {
  final String? textfieldname;
  final String? innerHint;

  final TextInputType? textInputtype;
  final Widget? suffixwidget;
  final Function? onChanged;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  const SpecialTextfield({
    super.key,
    this.maxlines,
    this.controller,
    this.ishidden,
    this.onChanged,
    this.suffixwidget,
    this.isMultiline,
    this.textCapitalization,
    this.textInputtype,
    this.textfieldname,
    this.enableSuggestion,
    this.innerHint,
    this.prefixIcon,
    this.border,
    this.contentPadding,
    this.validator,
  });
  final bool? ishidden;
  final bool? enableSuggestion;
  final TextEditingController? controller;
  final int? maxlines;
  final InputBorder? border;
  final bool? isMultiline;

  final EdgeInsets? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      controller: controller,
      keyboardType: textInputtype,
      cursorHeight: 20,
      style: AppTextStyles.small15,
      obscureText: ishidden ?? false,
      maxLines: isMultiline == false || maxlines == null ? 1 : maxlines,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      autocorrect: false,
      enableSuggestions: enableSuggestion ?? false,
      decoration: InputDecoration(
        labelText: textfieldname,
        prefixIcon: prefixIcon,
        fillColor: Theme.of(context).canvasColor.withOpacity(0.8),
        hintStyle: const TextStyle(fontWeight: FontWeight.w300),
        hintText: innerHint,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        focusedBorder: border ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? AppColors.white
                        : AppColors.black)),
        suffixIcon: suffixwidget,
        enabledBorder: border ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? AppColors.white
                        : AppColors.black)),
        border: border ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
      ),
    );
  }
}
