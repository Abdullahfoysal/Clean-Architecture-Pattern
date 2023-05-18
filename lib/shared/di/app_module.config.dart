// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

import '../../features/company/data/network/company_remote_impl.dart' as _i8;
import '../../features/company/data/network/service/company_api.dart' as _i6;
import '../../features/company/data/repository/company_remote.dart' as _i7;
import '../../features/company/data/repository/company_repository_impl.dart'
    as _i10;
import '../../features/company/domain/repository/company_repository.dart'
    as _i9;
import '../../features/company/domain/usecase/get_company_data_usecase.dart'
    as _i11;
import '../../features/company/presentation/company_screen_viewmodel.dart'
    as _i12;
import '../data/network/di/network_module.dart' as _i13;
import '../services/navigation_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

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
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Dio>(() => networkModule.dio);
  gh.lazySingleton<Map<String, String>>(() => networkModule.headers);
  gh.singleton<_i4.NavigationService>(_i4.NavigationServiceImp());
  gh.lazySingleton<_i5.PrettyDioLogger>(
      () => networkModule.dioLoggingInterceptor);
  gh.factory<String>(
    () => networkModule.baseURL,
    instanceName: 'baseURL',
  );
  gh.factory<_i6.CompanyAPIs>(() => _i6.CompanyAPIs(
        get<_i3.Dio>(),
        baseUrl: get<String>(instanceName: 'baseURL'),
      ));
  gh.factory<_i7.CompanyRemote>(
      () => _i8.CompanyRemoteImpl(get<_i6.CompanyAPIs>()));
  gh.factory<_i9.CompanyRepository>(
      () => _i10.CompanyRepositoryImpl(get<_i7.CompanyRemote>()));
  gh.factory<_i11.GetCompanyDataUseCase>(
      () => _i11.GetCompanyDataUseCase(get<_i9.CompanyRepository>()));
  gh.factory<_i12.CompanyScreenViewModel>(() => _i12.CompanyScreenViewModel(
        get<_i11.GetCompanyDataUseCase>(),
        get<_i4.NavigationService>(),
      ));
  return get;
}

class _$NetworkModule extends _i13.NetworkModule {}
