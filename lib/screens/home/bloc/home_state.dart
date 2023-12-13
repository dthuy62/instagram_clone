import '../../../common/base_state.dart';
import '../../../common/error.dart';
import '../../../models/dtos/city.dart';

/// States should extend [BaseState]
abstract base class HomeState extends BaseState {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class CitiesLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class LoadCitiesSuccess extends HomeState {
  LoadCitiesSuccess(this.cities);

  final List<City> cities;

  @override
  List<Object?> get props => [cities];
}

final class LoadCitiesError extends HomeState {
  LoadCitiesError(this.error);

  final DataSourceError error;

  @override
  List<Object?> get props => [error];
}
