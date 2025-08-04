part of 'geocode_cubit.dart';

@immutable
sealed class GeocodeState {}

final class GeocodeInitial extends GeocodeState {}




class AddressFormatedCoord extends GeocodeState{

   AddressFormatedCoord({required this.address});

  final AddressModel? address;
}


class GeoCodeError extends GeocodeState{


GeoCodeError({required this.message});

  final String message;
}