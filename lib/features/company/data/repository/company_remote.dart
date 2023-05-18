import 'package:company/features/company/params/new_company_request_param.dart';
import 'package:result_monad/result_monad.dart';

import '../../../../shared/error/error.dart';
import '../../entity/company_response.dart';

abstract class CompanyRemote {
  Stream<Result<CompanyResponse, ErrorModel>> fetchCompanyList();

  Stream<Result<bool, ErrorModel>> addNewCompany(
      NewCompanyReqParam newCompanyReqParam);
}
