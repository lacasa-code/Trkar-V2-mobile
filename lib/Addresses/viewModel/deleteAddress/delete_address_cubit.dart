import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../viewModel/myAddresses/my_addresses_cubit.dart';
import '../../../core/components/custom_new_dialog.dart';
import '../../../core/helper/app_localization.dart';
import '../../repo/delete_address_repo.dart';

part 'delete_address_state.dart';

class DeleteAddressCubit extends Cubit<DeleteAddressState> {
  DeleteAddressCubit() : super(DeleteAddressInitial());

  Future<void> deleteAddress(BuildContext context, dynamic addressId) async {
    var dialog = CustomDialog();
    emit(DeleteAddressLoading(addressId: addressId));
    var delete = await DeleteAddressRepo.deleteAddress(
      context,
      body: {
        'address_id': addressId,
      },
    );
    if (delete == null) {
      dialog.showWarningDialog(
        context: context,
        msg: localization.text('network'),
        btnOnPress: () {},
      );
      emit(DeleteAddressNetworkError());
      return;
    }

    if (delete.success == true) {
      context.read<MyAddressesCubit>().deleteAddress(addressId);
      Fluttertoast.showToast(
        msg: delete.message ?? '',
      );
      emit(DeleteAddressDone());
    } else {
      Fluttertoast.showToast(
        msg: delete.message ?? localization.text('something_wrong'),
      );
      emit(DeleteAddressError());
    }
  }
}
