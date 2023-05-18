import 'package:company/features/company/params/new_company_request_param.dart';
import 'package:result_monad/result_monad.dart';

import '../../../../shared/error/error.dart';

abstract class CompanyRemote {
  Stream<Result<String?, ErrorModel>> fetchCompanyList();

  Stream<Result<bool, ErrorModel>> addNewCompany(
      NewCompanyReqParam newCompanyReqParam);
}
