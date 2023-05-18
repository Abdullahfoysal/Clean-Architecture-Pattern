import 'package:company/features/company/domain/usecase/get_company_data_usecase.dart';
import 'package:company/shared/presentation/extensions/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/presentation/base_view_model.dart';
import '../entity/company_response.dart';

@injectable
class CompanyScreenViewModel extends BaseViewModel {
  final GetCompanyDataUseCase _getCompanyDataUseCase;
  late Stream<CompanyResponse> companyStream;
  CompanyScreenViewModel(this._getCompanyDataUseCase) {
    _init();
  }
  _init() {
    companyStream = _getCompanyDataUseCase.result.mapSuccess((event) => event);
  }

  onScreenStarted() {
    _getCompanyDataUseCase.execute();
  }
}
