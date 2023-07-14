import 'package:flutter/material.dart';
import 'package:hollo/core/core.dart';

class TStyles {
  static TextStyle h1({Color? color}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle h2({Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle h3({Color? color}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle h4({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle sh1({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle sh2({Color? color}) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle sh3({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle sh4({Color? color}) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle sh5({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle sh6({Color? color}) {
    return TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle p1({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle p2({Color? color}) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle p3({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle p4({Color? color}) {
    return TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: color ?? MyColor.text,
    );
  }

  static TextStyle p5({Color? color}) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: color ?? MyColor.text,
    );
  }
}
