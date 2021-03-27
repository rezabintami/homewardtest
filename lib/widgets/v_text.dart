import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class VText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign align;
  final bool money;
  final bool number;
  final TextDecoration decoration;
  final int maxLines;
  final Color color;

  VText(this.title,
      {this.fontSize,
      this.fontWeight,
      this.overflow = TextOverflow.ellipsis,
      this.money = false,
      this.number = false,
      this.decoration,
      this.maxLines,
      this.align,
      this.color});

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf;
    if (number || money) {
      fmf = FlutterMoneyFormatter(
        amount: (title != null && title != "" && title != "null")
            ? double.parse(title)
            : 0.0,
        settings: MoneyFormatterSettings(
          symbol: !number ? '\$' : '',
          thousandSeparator: ',',
          decimalSeparator: '.',
          symbolAndNumberSeparator: '',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
        ),
      );
    }

    return Text(
      title != null && title != "null"
          ? money || number
              ? fmf.output.symbolOnLeft
              : title
          : "",
      style: TextStyle(
        fontFamily: "poppins",
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      overflow: overflow,
      textAlign: align,
      maxLines: maxLines,
    );
  }
}
