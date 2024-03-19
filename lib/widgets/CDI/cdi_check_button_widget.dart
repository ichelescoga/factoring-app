import 'package:developer_company/controllers/CDI/cdi_check_button_controller.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:flutter/material.dart';

class CDICheckButton extends StatefulWidget {
  final String text;
  final CDICheckController controller;
  final bool isEnable;

  CDICheckButton(
      {Key? key,
      required this.text,
      required this.controller,
      this.isEnable = true})
      : super(key: key);

  @override
  _CDICheckButtonState createState() => _CDICheckButtonState();
}

class _CDICheckButtonState extends State<CDICheckButton> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.text, style: TextStyle(color: Colors.black)),
      value: widget.controller.isChecked,
      onChanged: (bool value) {
        if (!widget.isEnable) return;
        widget.controller.isChecked = value;
        setState(() {});
      },
      activeColor: AppColors.secondaryMainColor,
    );
  }
}
