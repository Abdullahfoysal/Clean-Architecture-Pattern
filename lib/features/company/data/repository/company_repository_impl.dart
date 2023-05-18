import 'package:company/features/company/data/repository/company_remote.dart';
import 'package:company/features/company/domain/repository/company_repository.dart';
import 'package:company/features/company/entity/company_response.dart';
import 'package:company/features/company/params/new_company_request_param.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/src/result_monad_base.dart';

import '../../../../shared/error/error.dart';

@Injectable(as: CompanyRepository)
class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemote _remoteSource;

  CompanyRepositoryImpl(this._remoteSource);

  @override
  Stream<Result<CompanyResponse, ErrorModel>> fetchCompanyList() =>
      _remoteSource.fetchCompanyList();

  @override
  Stream<Result<bool, ErrorModel>> addNewCompany(
          NewCompanyReqParam newCompany) =>
      _remoteSource.addNewCompany(newCompany);
}
