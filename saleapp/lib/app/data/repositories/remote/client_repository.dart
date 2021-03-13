import 'package:get/get.dart';
import 'package:saleapp/app/data/models/client.dart';
import 'package:saleapp/app/data/providers/remote/client_api.dart';

class ClientRepository {
  final ClientAPI _clientAPI = Get.find<ClientAPI>();

  Future<List<Client?>> getClient(
          {required token, required companyid, required branchofficeid}) =>
      _clientAPI.getClient(
          token: token, companyid: companyid, branchofficeid: branchofficeid);
}
