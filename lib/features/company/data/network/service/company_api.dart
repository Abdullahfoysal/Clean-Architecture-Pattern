import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../../shared/data/model/api_response.dart';
import '../../../entity/company_response.dart';
import '../../../params/new_company_request_param.dart';

part 'company_api.g.dart';

@injectable
@RestApi()
abstract class CompanyAPIs {
  @factoryMethod
  factory CompanyAPIs(Dio dio, {@Named("baseURL") String baseUrl}) =
      _CompanyAPIs;

  @GET("/company")
  Future<CompanyResponse> fetchCompanyList();

  @POST("/company")
  Future<ApiResponse> addNewCompany(
      @Body() NewCompanyReqParam newCompanyReqParam);
}
