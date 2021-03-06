part of 'tyres_filter_cubit.dart';

@immutable
abstract class TyresFilterState {}

class TyresFilterInitial extends TyresFilterState {}

class SeasonsLoading extends TyresFilterState {}

class ValueChanged extends TyresFilterState {}

class WidthLoading extends TyresFilterState {}

class HeightLoading extends TyresFilterState {}

class TyresManufacturersLoading extends TyresFilterState {}

class TyresAxleLoading extends TyresFilterState {}

class TyresLoadIndexLoading extends TyresFilterState {}

class Cleared extends TyresFilterState {}

class DiameterLoading extends TyresFilterState {}

class SpeedRatingLoading extends TyresFilterState {}

class TypesLoaing extends TyresFilterState {}

class TypesTabChanged extends TyresFilterState {}

class ScrollPositionChanged extends TyresFilterState {}

class Done extends TyresFilterState {}

class Error extends TyresFilterState {}
