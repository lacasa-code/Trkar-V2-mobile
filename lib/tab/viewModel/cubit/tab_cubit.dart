import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabInitial());

  var _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void changeTabIndex(int index) {
    _tabIndex = index;
    emit(
      TabIndexChanged(),
    );
  }
}
