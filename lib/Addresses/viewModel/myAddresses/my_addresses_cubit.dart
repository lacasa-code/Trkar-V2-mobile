import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/my_addresses_model.dart';
import '../../repo/my_addresses_repo.dart';

part 'my_addresses_state.dart';

class MyAddressesCubit extends Cubit<MyAddressesState> {
  MyAddressesCubit() : super(MyAddressesInitial());

  Future<void> getAddresses(context) async {
    emit(MyAddressesLoading());
    var addressData = await MyAddressesRepo.getMyAddresses(context);
    if (addressData == null) {
      emit(MyAddressesNetworkError());
      return;
    }
    if (addressData.success == true) {
      _addresses = addressData.data;
      _addresses!.sort(
        (a, b) => b.isDefault!.compareTo(a.isDefault ?? ''),
      );
      emit(MyAddressesDone());
    } else {
      emit(MyAddressesError());
    }
  }

  void deleteAddress(addressId) {
    var index = _addresses!.indexWhere((element) => element.id == addressId);
    if (index >= 0) {
      _addresses!.removeAt(index);
      emit(AddressDeleted());
    }
  }

  void addNewAddress(Map<String, dynamic> map, {int? addressId}) {
    var address = Address.fromJson(map);
    if (address.isDefault == '1') {
      var index = _addresses!.indexWhere((element) => element.isDefault == '1');
      if (index >= 0) {
        _addresses![index].isDefault = '0';
      }
    }
    if (addressId == null) {
      _addresses?.add(address);
    } else {
      var addressIndex =
          _addresses!.indexWhere((element) => element.id == addressId);
      if (addressIndex >= 0) {
        _addresses![addressIndex] = address;
      }
    }
    _addresses!.sort(
      (a, b) => b.isDefault!.compareTo(a.isDefault ?? ''),
    );
    emit(NewAddressAdded());
  }

  /// setters ...

  List<Address>? _addresses = [];

  /// getters  .....

  List<Address> get addresses => [...?_addresses];
}
