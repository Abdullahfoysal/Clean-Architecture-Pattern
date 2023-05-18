import 'package:ehadid/features/home/data/network/model/hadid_home_response.dart';
import 'package:ehadid/features/home/domain/repository/hadid_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';

import '../../../../shared/domain/usecase/base_use_case.dart';
import '../../../../shared/error/error.dart';
import '../../../../shared/vo/error.dart';

@injectable
class GetCompanyDataUseCase
    extends BaseUseCaseParam<String, Result<String?, ErrorModel>> {
  final HadidRepository _homeRepository;

  GetCompanyDataUseCase(this._homeRepository);

  @override
  Stream<Result<HomeLists?, ErrorModel>> invoke(String premiumUser) =>
      _homeRepository.fetchHome(premiumUser);
}
