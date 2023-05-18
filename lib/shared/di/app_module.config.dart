// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/company/data/network/company_remote_impl.dart' as _i6;
import '../../features/company/data/network/service/company_api.dart' as _i3;
import '../../features/company/data/repository/company_remote.dart' as _i5;
import '../../features/company/data/repository/company_repository_impl.dart'
    as _i8;
import '../../features/company/domain/repository/company_repository.dart'
    as _i7;
import '../../features/company/domain/usecase/get_company_data_usecase.dart'
    as _i10;
import '../../features/company/presentation/company_screen_viewmodel.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.CompanyAPIs>(() => _i3.CompanyAPIs(
        get<_i4.Dio>(),
        baseUrl: get<String>(instanceName: 'baseURL'),
      ));
  gh.factory<_i5.CompanyRemote>(
      () => _i6.CompanyRemoteImpl(get<_i3.CompanyAPIs>()));
  gh.factory<_i7.CompanyRepository>(
      () => _i8.CompanyRepositoryImpl(get<_i5.CompanyRemote>()));
  gh.factory<_i9.CompanyScreenViewModel>(() => _i9.CompanyScreenViewModel());
  gh.factory<_i10.GetCompanyDataUseCase>(
      () => _i10.GetCompanyDataUseCase(get<dynamic>()));
  return get;
}
