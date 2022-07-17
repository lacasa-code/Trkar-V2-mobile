import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/components/register_button.dart';
import 'package:trkar/core/components/register_field.dart';
import 'package:trkar/core/components/sized_box_helper.dart';
import 'package:trkar/support/view/widgets/form_tile_item.dart';
import '../../core/extensions/string.dart';

class SubmitARequest extends StatefulWidget {
  const SubmitARequest({Key? key}) : super(key: key);

  @override
  State<SubmitARequest> createState() => _SubmitARequestState();
}

class _SubmitARequestState extends State<SubmitARequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'submit_a_request'.translate,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Theme.of(context).primaryIconTheme.color,
          iconSize: ScreenUtil().radius(15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormFieldTileItem(
              title: 'name'.translate,
            ),
            FormFieldTileItem(
              title: 'mobile'.translate,
              keyboardType: TextInputType.phone,
            ),
            FormFieldTileItem(
              title: 'subject'.translate,
            ),
            FormFieldTileItem(
              title: 'description'.translate,
              isDescription: true,
              maxLines: 5,
            ),
            FormFieldTileItem(
              title: 'category'.translate,
            ),
            FormFieldTileItem(
              optionalTitle: 'how_can_help'.translate,
            ),
            FormFieldTileItem(
              optionalTitle: 'attachment'.translate,
              enabled: false,
              hintText: 'add_file',
            ),
            RegisterButton(
              radius: 12,
              title: 'submit',
              onPressed: () {},
            ),
            const BoxHelper(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
