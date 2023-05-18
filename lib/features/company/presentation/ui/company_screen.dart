import 'package:company/features/company/presentation/company_screen_viewmodel.dart';
import 'package:company/shared/presentation/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_observer/Observable.dart';
import 'package:flutter_observer/Observer.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/presentation/base_screen.dart';
import '../../../../shared/presentation/extensions/custom_stream_builder.dart';

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
    return BaseScreen(
      child: SingleChildScrollView(
          child: Stack(
        children: [
          CustomStreamBuilder(
              stream: viewModel.companyStream,
              onData: (String? data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                );
              },
              onErrorRefresh: () {},
              onError: (error) => Container(),
              onLoading: () => loader(context))
        ],
      )),
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
