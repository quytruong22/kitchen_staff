import 'package:chef_application/repos/models/link_checkdetail_check.dart';
import 'package:chef_application/repos/models/location_obj.dart';

class LocationCheckdetailCheck {
  final List<LocationDTO> listLocation;
  final List<CheckdetailCheck> listCheckdetailCheck;

  LocationCheckdetailCheck(
      {required this.listCheckdetailCheck, required this.listLocation});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locationlist'] =
        listLocation.map((location) => location.toJson()).toList();
    data['detaillist'] =
        listCheckdetailCheck.map((item) => item.toJson()).toList();
    return data;
  }
}
