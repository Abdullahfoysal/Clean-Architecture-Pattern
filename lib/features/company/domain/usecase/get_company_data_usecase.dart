import 'package:company/features/company/domain/repository/company_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';

import '../../../../shared/domain/usecase/base_use_case.dart';
import '../../../../shared/error/error.dart';
import '../../entity/company_response.dart';

@injectable
class GetCompanyDataUseCase
    extends BaseUseCase<Result<CompanyResponse, ErrorModel>> {
  final CompanyRepository _companyRepository;

  GetCompanyDataUseCase(this._companyRepository);

  @override
  Stream<Result<CompanyResponse, ErrorModel>> invoke() =>
      _companyRepository.fetchCompanyList();
}
