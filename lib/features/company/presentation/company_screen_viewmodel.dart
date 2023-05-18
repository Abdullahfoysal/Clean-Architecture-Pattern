import 'package:injectable/injectable.dart';

import '../../../shared/presentation/base_view_model.dart';

@injectable
class CompanyScreenViewModel extends BaseViewModel {
  late Stream<String> profileStream;
  CompanyScreenViewModel() {
    _init();
  }
  _init() {}

  onScreenStarted() {}
}
