import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/tag.dart';


class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
    required this.tag
  }) : super(key: key);

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    const v = 0.7;
    const v1 = 0.9;
    return Theme(
      data: ThemeData(
        chipTheme: ChipThemeData(
          backgroundColor: tag.color.withAlpha(50),
          labelStyle: TextStyle(
            color: Color.fromARGB(
              255, 
              (tag.color.red * v).toInt(), 
              (tag.color.green * v).toInt(), 
              (tag.color.blue * v).toInt()
            )
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromARGB(
                255, 
                (tag.color.red * v1).toInt(), 
                (tag.color.green * v1).toInt(), 
                (tag.color.blue * v1).toInt()
              ),
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