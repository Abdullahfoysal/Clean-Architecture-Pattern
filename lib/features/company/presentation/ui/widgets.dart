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
          padding: AppDesign.screenBodyPadding(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  company.company_name ?? "",
                  style: TextStyles.header0(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  company.email ?? "",
                  style: TextStyles.subTitle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  company.phone ?? "",
                  style: TextStyles.subTitle(),
                ),
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
