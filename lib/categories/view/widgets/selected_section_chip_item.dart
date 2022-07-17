import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SelectedSectionChip extends StatelessWidget {
  const SelectedSectionChip({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final String name;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: onPressed,
        child: Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isSelected ? 1 : 0,
          backgroundColor:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          label: Text(
            name,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}