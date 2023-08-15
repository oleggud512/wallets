import 'package:ads_pay_app/src/core/common/constants/color.dart';
import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/tag.dart';


class TagWidget extends StatelessWidget {
  static const _textShade = 0.7;
  static const _borderShade = 0.9;
  static const _lightBackgroundOpacity = 0.3;
  static const _darkBackgroundShade = 0.3;

  const TagWidget({
    Key? key,
    required this.tag
  }) : super(key: key);

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Theme(
      data: ThemeData(
        chipTheme: ChipThemeData(
          brightness: Theme.of(context).brightness,
          backgroundColor: brightness == Brightness.light 
            ? tag.color.withOpacity(_lightBackgroundOpacity) 
            : tag.color * _darkBackgroundShade,
          labelStyle: TextStyle(
            color: tag.color * _textShade
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: tag.color * _borderShade,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(p32)
          )
        )
      ),
      child: Chip(label: Text(tag.name)),
    );
  }
}