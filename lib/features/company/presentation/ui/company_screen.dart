import 'package:company/features/company/presentation/company_screen_viewmodel.dart';
import 'package:company/features/company/presentation/ui/widgets.dart';
import 'package:company/shared/presentation/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_observer/Observable.dart';
import 'package:flutter_observer/Observer.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/presentation/base_screen.dart';
import '../../../../shared/presentation/extensions/custom_stream_builder.dart';
import '../../../../shared/presentation/widget/custom_list.dart';
import '../../../../shared/res/style/app_colors.dart';
import '../../../../shared/res/style/app_design.dart';
import '../../entity/company_response.dart';
import '../../entity/data.dart';

class CompanyScreen extends StackedView<CompanyScreenViewModel> with Observer {
  CompanyScreen({super.key});
  late CompanyScreenViewModel companyScreenViewModel;
  @override
  void onViewModelReady(CompanyScreenViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    companyScreenViewModel = viewModel;
    viewModel.onScreenStarted();
    Observable.instance.addObserver(this);
  }

  @override
  void onDispose(CompanyScreenViewModel viewModel) {
    // TODO: implement onDispose
    super.onDispose(viewModel);
    Observable.instance.removeObserver(this);
  }

  @override
  Widget builder(
      BuildContext context, CompanyScreenViewModel viewModel, Widget? child) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.lightGreen,
        onPressed: () {},
        label: Text(
          "Create Company",
          style: TextStyle(
              fontFamily: fontFamilyName, color: AppColors.whiteColor),
        ),
      ),
      body: BaseScreen(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Company List",
                    style: TextStyles.header0()
                        .copyWith(color: AppColors.alertTitleColor),
                  ),
                ],
              ),
            ),
            AppDesign.divider(),
            Expanded(
              child: CustomStreamBuilder(
                  stream: viewModel.companyStream,
                  onData: (CompanyResponse companyListData) {
                    List<Data> companyList =
                        companyListData.company_list?.data ?? [];
                    return CustomListView<Data>(
                        companyList, companyItem, noItem);
                  },
                  onErrorRefresh: () {},
                  onError: (error) => Center(
                          child: Container(
                        child: Text("Something went wrong!"),
                      )),
                  onLoading: () => loader(context)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CompanyScreenViewModel viewModelBuilder(BuildContext context) {
    return GetIt.I.get<CompanyScreenViewModel>();
  }

  @override
  update(Observable observable, String? notifyName, Map? map) {
    companyScreenViewModel.onScreenStarted();
  }
}
