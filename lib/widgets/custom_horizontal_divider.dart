// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:developer_company/shared/constants/globalVariables.dart';
import 'package:developer_company/shared/resources/colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
        style: TextStyle(
          color: AppColors.alternativeBlack,
          fontWeight: FontWeight.w500
        ),),
        Divider(
          height: HrDividerVariables.height,
          thickness: HrDividerVariables.thickness,
          endIndent: HrDividerVariables.endIndent,
          color: AppColors.secondaryMainColor,
        ),
      ],
    );
  }
}
