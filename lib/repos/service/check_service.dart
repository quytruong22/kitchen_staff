import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/repository/check_repository.dart';

class CheckService {
  CheckRespository respo = CheckRespository();

  Future<List<CheckDTO>> getChecks() async {
    return respo.getChecks();
  }

  void readyCheckDetail(List<CheckDTO> list) {
    respo.readyCheckdetails(list);
  }

  void recallCheckDetail(List<CheckDTO> list) {
    respo.recallCheckdetails(list);
  }
}
