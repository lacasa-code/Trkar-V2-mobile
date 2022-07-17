import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/register_field.dart';
import '../../../../core/extensions/string.dart';


class StoreBranchView extends StatelessWidget {
  const StoreBranchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'store_branch'.translate.toTitleCase,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          const RegisterField(
            labelText: 'branch_name',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'branch_address',
            thinBorder: true,
          ),
          const RegisterField(
            labelText: 'phone',
            keyboardType: TextInputType.phone,
            thinBorder: true,
          ),
        ],
      ),
    );
  }
}



