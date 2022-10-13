import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/dto/job/job_out_dto.dart';
import '../../../../data/remote/api/api_routes.dart';
import '../../../../widgets/custom_job_card.dart';
import '../../controllers/saved_controller.dart';

class SavedJobs extends GetView<SavedController> {
  const SavedJobs({
    Key? key,
    required this.jobs,
  }) : super(key: key);
  final List<JobOutDto> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 22.h),
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) => jobs.removeAt(index),
          child: CustomJobCard(
            avatar: "${ApiRoutes.BASE_URL}${jobs[index].company!.image}",
            companyName: jobs[index].company!.name!,
            employmentType: jobs[index].employmentType,
            jobPosition: jobs[index].position,
            location: jobs[index].location,
            actionIcon: HeroIcons.bookmark,
            isSaved: true,
            publishTime: jobs[index].createdAt!,
            workplace: jobs[index].workplace,
            description: jobs[index].description,
            onActionTap: (isSaved) =>
                controller.onSaveButtonTapped(isSaved, jobs[index].id!),
          ),
        ),
      ),
    );
  }
}
