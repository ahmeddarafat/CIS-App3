import 'package:cis_app3/models/doctor_model.dart';
import 'package:cis_app3/resources/constants/app_strings.dart';
import 'package:cis_app3/resources/widgets/public_button.dart';
import 'package:cis_app3/viewmodel/profile/cubit/profile_cubit.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../resources/constants/app_colors.dart';
import '../resources/widgets/app_text.dart';

const List<String> times = [
  "5:30",
  "6:00",
  "6:30",
  "7:00",
  "7:30",
  "8:00",
  "8:30",
  "9:00",
  "9:30",
  "10:00",
  "10:30",
  "11:00",
];

class ProfilePage extends StatelessWidget {
  final DoctorModel doctor;
  const ProfilePage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 220.h),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        var cubit = ProfileCubit.get(context);
                        return AppText(
                          text: DateFormat("MMMM, yyyy")
                              .format(cubit.selectedDate),
                          color: AppColors.black,
                          fz: 20.sp,
                          fw: FontWeight.bold,
                        );
                      },
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 90.h,
                      child: const BuildDatePicker(),
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      text: AppStrings.moring,
                      color: AppColors.black,
                      fz: 20.sp,
                      fw: FontWeight.bold,
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 65.h,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5.h,
                            crossAxisSpacing: 15.w,
                            childAspectRatio: 3),
                        itemBuilder: (context, index) {
                          return TimeCard(
                            time: times[index + 6],
                            suffix: "AM",
                            index: index + 6,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppText(
                      text: AppStrings.evening,
                      color: AppColors.black,
                      fz: 20.sp,
                      fw: FontWeight.bold,
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 65.h,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5.h,
                            crossAxisSpacing: 15.w,
                            childAspectRatio: 3),
                        itemBuilder: (context, index) {
                          return TimeCard(
                            time: times[index],
                            suffix: "PM",
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    PublicButton(
                      text: AppStrings.makeAnAppointment,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 200.h,
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: AppColors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_active_outlined,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Container(
                            height: 120.h,
                            width: 100.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              doctor.img,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: doctor.name,
                                color: AppColors.white,
                                fz: 18.sp,
                                fw: FontWeight.bold,
                              ),
                              SizedBox(height: 10.w),
                              AppText(
                                text: doctor.specialist,
                                color: AppColors.grey,
                                fz: 16.sp,
                                fw: FontWeight.bold,
                              ),
                              SizedBox(height: 10.w),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (int i = 0; i < doctor.rate.floor(); i++)
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.sp,
                                    ),
                                  if (doctor.rate * 10 % 10 > 0)
                                    Icon(
                                      Icons.star_half,
                                      color: Colors.yellow,
                                      size: 20.sp,
                                    ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 40.w,
              top: 180.h,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.5),
                        blurRadius: 5,
                      )
                    ]),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.pin_drop,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final String time;
  final String suffix;
  final int index;
  const TimeCard({
    super.key,
    required this.time,
    required this.suffix,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      // To make it just rebuild two widgets not all 12 widgets
      buildWhen: (previous, current) {
        if (previous is ChangeSelectedTime) {
          if (previous.index == index) return true;
        }
        if (current is ChangeSelectedTime) {
          if (current.index == index) return true;
        }
        return false;
      },
      builder: (context, state) {
        debugPrint("container is rebuilt");
        var cubit = ProfileCubit.get(context);
        bool isSelected = cubit.selectedTime == index;
        return InkWell(
          onTap: () {
            cubit.changeSelectedTime(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.green : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.watch_later_outlined,
                    size: 20.sp,
                    color: isSelected ? Colors.white : AppColors.black),
                AppText(
                  text: "$time $suffix",
                  fz: 15.sp,
                  color: isSelected ? Colors.white : AppColors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BuildDatePicker extends StatelessWidget {
  const BuildDatePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return DatePicker(
      DateTime.now(),
      width: 80.w,
      selectionColor: AppColors.green,
      initialSelectedDate: DateTime.now(),
      monthTextStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      dateTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      dayTextStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      onDateChange: (newDate) {
        cubit.changeSelectedDate(newDate);
      },
    );
  }
}

/// summary
// --------------------------------------
// [1] intl Package
//          1. use date fromat (convert DateTime to string)
//          2. Usage
//               - DateFormat("pattern").format(selectedDate)
//               - ex: DateFormat("MMMM, yyyy").format(DateTime.not())
//                     February, 2023
//          3. Pattern
//               Symbol   Meaning
//               ------   -------
//               G        era designator
//               y        year
//               M        month in year
//               L        standalone month
//               d        day in month
//               c        standalone day
//               h        hour in am/pm (1~12)
//               H        hour in day (0~23)
//               m        minute in hour
//               s        second in minute
//               S        fractional second
//               E        day of week
//               D        day in year
//               a        am/pm marker
//               k        hour in day (1~24)
//               K        hour in am/pm (0~11)
//               Q        quarter
//               '        escape for text
//               ''       single quote
