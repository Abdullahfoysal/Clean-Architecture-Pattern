import 'package:company/features/company/domain/usecase/add_new_company_usecase.dart';
import 'package:company/features/company/domain/usecase/get_company_data_usecase.dart';
import 'package:company/features/company/params/new_company_request_param.dart';
import 'package:company/shared/presentation/extensions/extensions.dart';
import 'package:company/shared/res/style/app_design.dart';
import 'package:company/shared/services/navigation_service.dart';
import 'package:company/shared/validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/presentation/base_view_model.dart';
import '../../../shared/presentation/widget/custom_input_form_field.dart';
import '../../../shared/res/style/app_colors.dart';
import '../entity/company_response.dart';

@injectable
class CompanyScreenViewModel extends BaseViewModel {
  final GetCompanyDataUseCase _getCompanyDataUseCase;
  final AddNewCompanyUsecase _addNewCompanyUsecase;
  final NavigationService _navigationService;
  late Stream<CompanyResponse> companyDataStream;
  late Stream<bool> createCompanyResponseStream;
  NewCompanyReqParam _newCompanyReqParam = NewCompanyReqParam();
  final formkey = GlobalKey<FormState>();
  CompanyScreenViewModel(this._getCompanyDataUseCase, this._navigationService,
      this._addNewCompanyUsecase) {
    _init();
  }
  _init() {
    companyDataStream =
        _getCompanyDataUseCase.result.mapSuccess((event) => event);
    createCompanyResponseStream =
        _addNewCompanyUsecase.result.mapSuccess((event) => event);
    createCompanyResponseStream.listen((event) {
      _loadCompanyList();
    });
  }

  onScreenStarted() {
    _loadCompanyList();
  }

  void _loadCompanyList() {
    _getCompanyDataUseCase.execute();
  }

  _onChangeCompanyName(String name) {
    _newCompanyReqParam.company_name = name;
  }

  _onChangeEmail(String email) {
    _newCompanyReqParam.email = email;
  }

  _onChangePassword(String pass) {
    _newCompanyReqParam.password = pass;
  }

  _onChangePhone(String phone) {
    _newCompanyReqParam.phone = phone;
  }

  showAddNewCompanyPopUp(BuildContext context) {
    _newCompanyReqParam = NewCompanyReqParam();
    Widget content = Container(
      //  height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
            child: Text(
              "Create a New Company",
              style: TextStyles.header0(),
            ),
          ),
          Form(
            key: formkey,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: AppDesign.screenBodyPadding(),
                  child: customInputTextFormField(
                    validator: FormValidator.name,
                    onChanged: _onChangeCompanyName,
                    context: context,
                    decoration: InputDecoration(
                      border: inputBorder,
                      filled: true,

                      labelStyle: TextStyles.subTitle()
                        ..copyWith(color: AppColors.whiteColor),
                      fillColor: AppColors.whiteColor,
                      focusedBorder: focusedEnabledBorder,
                      enabledBorder: focusedEnabledBorder,
                      counterText: "",
                      // contentPadding: const EdgeInsets.only(left: 15),
                      hintText: "Company Name",
                      hintStyle: TextStyle(
                          fontFamily: fontFamilyName,
                          color: AppColors.formHintTextColor,
                          fontSize: TextStyles.h1,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                AppDesign.spaceWidgets(height: 8),
                Padding(
                  padding: AppDesign.screenBodyPadding(),
                  child: customInputTextFormField(
                    validator: FormValidator.email,
                    onChanged: _onChangeEmail,
                    context: context,
                    decoration: InputDecoration(
                      border: inputBorder,
                      filled: true,

                      labelStyle: TextStyles.subTitle()
                        ..copyWith(color: AppColors.whiteColor),
                      fillColor: AppColors.whiteColor,
                      focusedBorder: focusedEnabledBorder,
                      enabledBorder: focusedEnabledBorder,
                      counterText: "",
                      // contentPadding: const EdgeInsets.only(left: 15),
                      hintText: "Work Email",
                      hintStyle: TextStyle(
                          fontFamily: fontFamilyName,
                          color: AppColors.formHintTextColor,
                          fontSize: TextStyles.h1,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                AppDesign.spaceWidgets(height: 8),
                Padding(
                  padding: AppDesign.screenBodyPadding(),
                  child: customInputTextFormField(
                    validator: FormValidator.password,
                    onChanged: _onChangePassword,
                    context: context,
                    decoration: InputDecoration(
                      border: inputBorder,
                      filled: true,

                      labelStyle: TextStyles.subTitle()
                        ..copyWith(color: AppColors.whiteColor),
                      fillColor: AppColors.whiteColor,
                      focusedBorder: focusedEnabledBorder,
                      enabledBorder: focusedEnabledBorder,
                      counterText: "",
                      // contentPadding: const EdgeInsets.only(left: 15),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontFamily: fontFamilyName,
                          color: AppColors.formHintTextColor,
                          fontSize: TextStyles.h1,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                AppDesign.spaceWidgets(height: 8),
                Padding(
                  padding: AppDesign.screenBodyPadding(),
                  child: customInputTextFormField(
                    keyboardType: TextInputType.phone,
                    validator: FormValidator.phone,
                    onChanged: _onChangePhone,
                    context: context,
                    decoration: InputDecoration(
                      border: inputBorder,
                      filled: true,

                      labelStyle: TextStyles.subTitle()
                        ..copyWith(color: AppColors.whiteColor),
                      fillColor: AppColors.whiteColor,
                      focusedBorder: focusedEnabledBorder,
                      enabledBorder: focusedEnabledBorder,
                      counterText: "",
                      // contentPadding: const EdgeInsets.only(left: 15),
                      hintText: "Phone",
                      hintStyle: TextStyle(
                          fontFamily: fontFamilyName,
                          color: AppColors.formHintTextColor,
                          fontSize: TextStyles.h1,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                AppDesign.spaceWidgets(height: 12),
                Padding(
                  padding: AppDesign.screenBodyPadding(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      if (formkey.currentState?.validate() == true) {
                        _navigationService.cancelPopUp(context);
                        _addNewCompanyUsecase.execute(_newCompanyReqParam);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Create a New Company",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: TextStyles.h1,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    _navigationService.showNewCompanyPopUp(context, content);
  }
}
