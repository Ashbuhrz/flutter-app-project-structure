import 'package:flutter/material.dart';
import 'package:project_structure/util/theme/theme_constant.dart';

class CommonDropDown extends StatelessWidget {
  final Map<String, dynamic>? items;
  final String? hintText;
  String? value;
  final Function(dynamic)? onChanged;
  CommonDropDown({this.items, this.hintText, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> dropDownItem = <DropdownMenuItem>[];
    items!.forEach((key, value) {
      dropDownItem.add(
        DropdownMenuItem(
          value: value,
          child: Text(
            key,
            // style: TxtStyles.txtParaNormal14400,
          ),
        ),
      );
    });
    return DropdownButtonFormField(
      items: dropDownItem,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.green),
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // border: Utils.inputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        labelText: hintText,
        // labelStyle:
        //     TxtStyles.txtParaNormal14400.copyWith(color: AppColors.grey1c),
      ),
      value: value,
      onTap: () {},
      onChanged: onChanged,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.txtGrey422c,
      ),
      dropdownColor: AppColors.white,
      // style: TxtStyles.txtParaNormal14400.copyWith(color: AppColors.grey1c),
    );
  }
}
