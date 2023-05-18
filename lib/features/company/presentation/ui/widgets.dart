import 'package:company/features/company/entity/data.dart';
import 'package:company/shared/res/style/app_colors.dart';
import 'package:company/shared/res/style/app_design.dart';
import 'package:flutter/cupertino.dart';

Widget companyItem(Data company, int index) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppDesign.screenBodyPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.company_name ?? "",
                style: TextStyles.header0(),
              ),
              Text(
                company.email ?? "",
                style: TextStyles.subTitle(),
              ),
              Text(
                company.phone ?? "",
                style: TextStyles.subTitle(),
              ),
            ],
          ),
        ),
        AppDesign.divider(),
      ],
    ),
  );
}

Widget noItem() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: AppColors.whiteColor),
    child: Text("No Company Available", style: TextStyles.header1()),
  );
}
