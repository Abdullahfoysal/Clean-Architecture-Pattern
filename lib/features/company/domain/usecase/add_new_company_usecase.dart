import 'package:company/features/company/params/new_company_request_param.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';

import '../../../../shared/domain/usecase/base_use_case.dart';
import '../../../../shared/error/error.dart';
import '../repository/company_repository.dart';

@injectable
class AddNewCompanyUsecase
    extends BaseUseCaseParam<NewCompanyReqParam, Result<bool, ErrorModel>> {
  final CompanyRepository _companyRepository;

  AddNewCompanyUsecase(this._companyRepository);

  @override
  Stream<Result<bool, ErrorModel>> invoke(NewCompanyReqParam params) =>
      _companyRepository.addNewCompany(params);
}
