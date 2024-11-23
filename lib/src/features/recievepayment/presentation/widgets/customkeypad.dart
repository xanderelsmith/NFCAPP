import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nfcapp/extension/textstyleextensions.dart';
import 'package:nfcapp/style/textstyles.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/themeprovider.dart';
import '../../../../../style/color.dart';

class CustomNumKeyPad extends StatelessWidget {
  const CustomNumKeyPad(
      {super.key,
      required this.leftButtonFn,
      required this.rightButtonFn,
      required this.rightButtonLongPressFn,
      required this.onNumTap,
      this.decoration,
      this.size,
      this.leftIcon,
      this.rightIcon,
      this.mainAxisAlignment,
      this.textColor});

  final Function()? leftButtonFn;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color? textColor;
  final Size? size;
  final Function()? rightButtonFn;
  final Decoration? decoration;
  final Function(String value) onNumTap;
  final Function()? rightButtonLongPressFn;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
        children: <Widget>[
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              calcButton('1', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              calcButton('2', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              calcButton('3', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
            ],
          ),
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              calcButton('4', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              calcButton('5', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              calcButton('6', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
            ],
          ),
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              calcButton('7', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              calcButton('8', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              calcButton('9', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
            ],
          ),
          OverflowBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: leftIcon)),
              calcButton('0', (value) {
                onNumTap(value);
              },
                  decoration: decoration,
                  size: size,
                  context: context,
                  textColor: textColor),
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: rightButtonFn,
                  onLongPress: rightButtonLongPressFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: rightIcon))
            ],
          ),
        ],
      ),
    );
  }
}

Widget calcButton(String value, Function(String value) onNumTap,
    {Decoration? decoration,
    Size? size,
    required BuildContext context,
    Color? textColor}) {
  return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: () {
        onNumTap(value);
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 14,
        ),
        decoration: decoration,
        alignment: Alignment.center,
        width: size != null ? size.width : 50,
        height: size != null ? size.height : 50,
        child: Text(value,
            style: AppTextStyles.medium22.w700
                .copyWith(color: textColor ?? AppColors.black)),
      ));
}
