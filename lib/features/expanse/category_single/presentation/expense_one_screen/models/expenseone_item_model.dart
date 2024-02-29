import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class ExpenseoneItemModel {
  ExpenseoneItemModel({
    required BuildContext context,
    this.eyeDoctorReview,
    this.iThoughtRozan,
    this.time,
    this.id,
  }) {
    eyeDoctorReview = eyeDoctorReview ?? context.localization.eye_doctor_review;
    iThoughtRozan = iThoughtRozan ??
        context.localization.eyes_doctor_review_red_description;
    id = id ?? "";
  }

  String? eyeDoctorReview;

  String? iThoughtRozan;

  String? time;

  String? id;
}
