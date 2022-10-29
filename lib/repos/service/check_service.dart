import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/repository/check_repository.dart';

class CheckService {
  CheckRespository respo = CheckRespository();
  // get check
  Future<List<CheckDTO>> getChecks() async {
    return respo.getChecks();
  }

  // notify ready
  void readyCheckDetail(List<CheckDTO> list) {
    respo.readyCheckdetails(list);
  }

  // notify recall
  void recallCheckDetail(List<CheckDTO> list) {
    respo.recallCheckdetails(list);
  }
}
