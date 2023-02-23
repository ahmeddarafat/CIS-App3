part of 'profile_cubit.dart';

@immutable
abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ChangeSelectedDate extends ProfileState {
  final DateTime selectedDate;

  ChangeSelectedDate(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];
}

class ChangeSelectedTime extends ProfileState {
  final int index;

  ChangeSelectedTime(this.index);

  @override
  List<Object?> get props => [index];
}
