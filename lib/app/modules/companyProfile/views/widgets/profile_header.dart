import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/custom_avatar.dart';
import '../../controllers/company_profile_controller.dart';

class ProfileHeader extends GetView<CompanyProfileController> {
  const ProfileHeader({
    Key? key,
    required this.avatar,
    required this.name,
  }) : super(key: key);
  final String avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      child: Column(
        children: [
          CustomAvatar(
            imageUrl: avatar,
          ),
          SizedBox(height: 5.h),
          Text(
            name,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: Get.theme.colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}
