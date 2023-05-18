import 'package:company/features/company/domain/usecase/get_company_data_usecase.dart';
import 'package:company/shared/presentation/extensions/extensions.dart';
import 'package:company/shared/res/style/app_design.dart';
import 'package:company/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/presentation/base_view_model.dart';
import '../../../shared/presentation/widget/custom_input_form_field.dart';
import '../../../shared/res/style/app_colors.dart';
import '../entity/company_response.dart';

@injectable
class CompanyScreenViewModel extends BaseViewModel {
  final GetCompanyDataUseCase _getCompanyDataUseCase;
  final NavigationService _navigationService;
  late Stream<CompanyResponse> companyStream;
  CompanyScreenViewModel(this._getCompanyDataUseCase, this._navigationService) {
    _init();
  }
  _init() {
    companyStream = _getCompanyDataUseCase.result.mapSuccess((event) => event);
  }

  onScreenStarted() {
    _getCompanyDataUseCase.execute();
  }

  showAddNewCompanyPopUp(BuildContext context) {
    Widget content = Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: customInputTextFormField(
              validator: (val) => null,
              onChanged: _onChangeCompanyName,
              context: context,
              decoration: InputDecoration(
                border: inputBorder,
                filled: true,
                labelStyle: TextStyles.subTitle()
                  ..copyWith(color: AppColors.grey),
                fillColor: Colors.black12,
                focusedBorder: focusedEnabledBorder,
                enabledBorder: focusedEnabledBorder,
                counterText: "",
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: "Company Name",
                hintStyle: TextStyles.subTitleBold(),
              ),
            ),
          ),
        ],
      ),
    );
    _navigationService.showNewCompanyPopUp(context, content);
  }

  _onChangeCompanyName(String p1) {}
}
