import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/register_button.dart';
import '../../viewModel/lang/lang_cubit.dart';

class ChooseLangWidget extends StatelessWidget {
  const ChooseLangWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        return Stack(
          children: [
            RegisterButton(
                radius: 12,
                title: Navigator.canPop(context) ? 'save' : 'next',
                onPressed: () {
                  context.read<LangCubit>().changeLanguage(
                        context: context,
                        canPop: Navigator.canPop(context),
                      );
                }),
            Positioned(
              top: ScreenUtil().setHeight(13),
              left: 0,
              right: 0,
              child: Visibility(
                visible: state is LoadingState,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: ScreenUtil().radius(20),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
