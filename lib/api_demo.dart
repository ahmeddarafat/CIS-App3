import 'package:cis_app3/models/category_model.dart';
import 'package:cis_app3/models/doctor_model.dart';
import 'package:cis_app3/resources/constants/app_assets.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categoriesDemo = [
  CategoryModel(
    icon: AppAssets.tooth,
    category: "Dental",
    numOfDoctors: 18,
  ),
  CategoryModel(
    icon: AppAssets.heart,
    category: "Heart",
    numOfDoctors: 8,
  ),
  CategoryModel(
    icon: AppAssets.brain,
    category: "Brain",
    numOfDoctors: 32,
  ),
  CategoryModel(
    icon: AppAssets.tooth,
    category: "Dental",
    numOfDoctors: 18,
  ),
  CategoryModel(
    icon: AppAssets.heart,
    category: "Heart",
    numOfDoctors: 8,
  ),
  CategoryModel(
    icon: AppAssets.brain,
    category: "Brain",
    numOfDoctors: 32,
  ),
];

List<DoctorModel> doctorsDemo = [
  DoctorModel(
    img: AppAssets.doctor1,
    name: "Dr. Kareem Benzema",
    specialist: "Heart Surgen",
    rate: 5,
    distance: 9,
  ),
  DoctorModel(
    img: AppAssets.doctor2,
    name: "Dr. Fred Mask",
    specialist: "Bones Specialist",
    rate: 4.8,
    distance: 6.5,
  ),
  DoctorModel(
    img: AppAssets.doctor3,
    name: "Dr. Harry Kane",
    specialist: "Eyes Specialist",
    rate: 3.8,
    distance: 10.5,
  ),
  DoctorModel(
    img: AppAssets.doctor4,
    name: "Dr. Sadio Mane",
    specialist: "Dental Specialist",
    rate: 2.8,
    distance: 1.2,
  ),
  DoctorModel(
    img: AppAssets.doctor1,
    name: "Dr. Kareem Benzema",
    specialist: "Heart Surgen",
    rate: 5,
    distance: 9,
  ),
  DoctorModel(
    img: AppAssets.doctor2,
    name: "Dr. Fard Mask",
    specialist: "Bones Specialist",
    rate: 4.8,
    distance: 6.5,
  ),
  DoctorModel(
    img: AppAssets.doctor3,
    name: "Dr. Harry Kane",
    specialist: "Eyes Specialist",
    rate: 3.8,
    distance: 10.5,
  ),
  DoctorModel(
    img: AppAssets.doctor4,
    name: "Dr. Sadio Mane",
    specialist: "Dental Specialist",
    rate: 2.8,
    distance: 1.2,
  ),
];
