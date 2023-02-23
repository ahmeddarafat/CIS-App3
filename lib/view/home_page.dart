import 'package:cis_app3/api_demo.dart';
import 'package:cis_app3/models/doctor_model.dart';
import 'package:cis_app3/resources/constants/app_assets.dart';
import 'package:cis_app3/resources/constants/app_colors.dart';
import 'package:cis_app3/resources/widgets/app_text.dart';
import 'package:cis_app3/resources/widgets/public_text_form_field.dart';
import 'package:cis_app3/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../resources/constants/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const HomeAppBar(),
            Positioned.fill(
              top: 60.h,
              child: Container(
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    AppText(
                      text: "${AppStrings.hi} Ahmed",
                      color: AppColors.blue,
                      fz: 20.sp,
                    ),
                    SizedBox(height: 10.h),
                    AppText(
                      text: AppStrings.welcomeBack,
                      color: AppColors.black,
                      fz: 25.sp,
                      fw: FontWeight.bold,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 60.h,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: PublicTextFormField(
                                hint: AppStrings.search,
                                controller: TextEditingController(),
                                borderRadius: 8,
                                borderColor: Colors.white,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            child: Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const TitleRow(title: AppStrings.category),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 120.h,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesDemo.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            icon: categoriesDemo[index].icon,
                            category: categoriesDemo[index].category,
                            numOfDoctors: categoriesDemo[index].numOfDoctors,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20.w),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    const TitleRow(title: AppStrings.category),
                    SizedBox(height: 15.h),
                    Expanded(
                      child: ListView.separated(
                        itemCount: doctorsDemo.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DoctorCard(doctor: doctorsDemo[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10.h);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfilePage(doctor: doctor),
          ),
        );
      },
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 50.h,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: doctor.name,
                    color: AppColors.black,
                    fz: 16.sp,
                    fw: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: doctor.specialist,
                        color: AppColors.grey,
                        fz: 14.sp,
                        fw: FontWeight.bold,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14.sp,
                      ),
                      AppText(
                        text: doctor.rate.toString(),
                        color: AppColors.grey,
                        fz: 14.sp,
                        fw: FontWeight.bold,
                      ),
                      Icon(
                        Icons.pin_drop,
                        color: Colors.yellow,
                        size: 14.sp,
                      ),
                      AppText(
                        text: doctor.distance.toString(),
                        color: AppColors.grey,
                        fz: 14.sp,
                        fw: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  final String title;
  const TitleRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          color: AppColors.black,
          fz: 22.sp,
          fw: FontWeight.bold,
        ),
        InkWell(
          onTap: () {},
          child: AppText(
            text: AppStrings.seeAll,
            color: AppColors.grey,
            fz: 18.sp,
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon;
  final String category;
  final int numOfDoctors;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.category,
    required this.numOfDoctors,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40.h,
              width: 40.h,
              child: Image.asset(
                icon,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 4.h),
            AppText(
              text: category,
              color: AppColors.white,
              fz: 18.sp,
              fw: FontWeight.bold,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: AppText(
                text: "$numOfDoctors Doctors",
                fz: 14.sp,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      color: AppColors.blue,
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: Row(
              children: [
                const Icon(
                  Icons.menu_sharp,
                  color: AppColors.white,
                ),
                const Spacer(),
                const Icon(
                  Icons.notifications_on,
                  color: AppColors.white,
                ),
                SizedBox(width: 10.w),
                Container(
                  // squre
                  height: 30.h,
                  width: 30.h,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    AppAssets.doctor1,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
