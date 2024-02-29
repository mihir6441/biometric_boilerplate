import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String? label;
  final EdgeInsets? padding;
  final int? groupValue;
  final int? value;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged!(value!);
        }
      },
      child: Padding(
        padding: padding!,
        child: Row(
          children: <Widget>[
            Radio<int>(
                groupValue: groupValue,
                value: value!,
                onChanged: (newValue) {
                  onChanged!(newValue!);
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
            Text(label!),
          ],
        ),
      ),
    );
  }
}
