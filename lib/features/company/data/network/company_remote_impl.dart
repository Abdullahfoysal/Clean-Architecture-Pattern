import 'package:company/features/company/data/network/service/company_api.dart';
import 'package:company/features/company/entity/company_response.dart';
import 'package:company/features/company/params/new_company_request_param.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';

import '../../../../shared/error/error.dart';
import '../repository/company_remote.dart';

@Injectable(as: CompanyRemote)
class CompanyRemoteImpl implements CompanyRemote {
  final CompanyAPIs _companyAPIs;
  CompanyRemoteImpl(this._companyAPIs);
  @override
  Stream<Result<CompanyResponse, ErrorModel>> fetchCompanyList() async* {
    try {
      var data = await _companyAPIs.fetchCompanyList();
      yield Result.ok(data);
    } catch (e) {
      yield Result.error(const ErrorModel(message: "error"));
    }
  }

  @override
  Stream<Result<bool, ErrorModel>> addNewCompany(
      NewCompanyReqParam newCompanyReqParam) async* {
    try {
      var data = await _companyAPIs.addNewCompany(newCompanyReqParam);
      yield Result.ok(data.statusCode == 200);
    } catch (e) {
      yield Result.error(const ErrorModel(message: "error"));
    }
  }
}
