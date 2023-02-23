import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

   static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  DateTime selectedDate = DateTime.now();

  void changeSelectedDate(DateTime dateTime) {
    selectedDate = dateTime;
    emit(ChangeSelectedDate(dateTime));
  }

  int? selectedTime;
  void changeSelectedTime(int index){
    selectedTime = index;
    emit(ChangeSelectedTime(index));

  }
}
