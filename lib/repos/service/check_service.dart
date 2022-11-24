import 'package:chef_application/repos/models/check_obj.dart';
import 'package:chef_application/repos/repository/check_repository.dart';

class CheckService {
  CheckRespository respo = CheckRespository();
  // get check
  Future<List<CheckDTO>> getChecks() async {
    return respo.getChecks();
  }

  // notify ready
  Future<void> readyCheckDetail(List<CheckDTO> list) async {
    await respo.readyCheckdetails(list);
  }

  // notify recall
  Future<void> recallCheckDetail(List<CheckDTO> list) async {
    await respo.recallCheckdetails(list);
  }
}
