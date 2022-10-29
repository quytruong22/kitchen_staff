import 'package:chef_application/repos/models/checkdetail_obj.dart';
import 'package:chef_application/repos/models/location_obj.dart';

class LocationCheckdetail {
  final List<LocationDTO> listLocation;
  final List<CheckDetailDTO> listCheckdetail;

  LocationCheckdetail(
      {required this.listLocation, required this.listCheckdetail});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locationlist'] =
        listLocation.map((location) => location.toJson()).toList();
    data['detaillist'] = listCheckdetail.map((item) => item.toJson()).toList();
    return data;
  }
}
