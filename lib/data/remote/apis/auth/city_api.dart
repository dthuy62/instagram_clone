import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/city.dart';
import '../base/api.dart';
import '../api_path.dart';

abstract interface class ICityApi {
  Future<Either<NetworkError, List<City>>> getCities();
}

final class CityApi extends Api implements ICityApi {
  const CityApi(super.dio);

  @override
  Future<Either<NetworkError, List<City>>> getCities() => withTimeoutRequest(
        () async {
          final data = await dio.get<dynamic>(ApiPath.cities);
          return (data.data as List<dynamic>)
              .map((e) => City.fromJson(e as Map<String, dynamic>))
              .toList();
        },
      );
}
