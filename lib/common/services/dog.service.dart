import 'package:dio/dio.dart';
import 'package:queritelpractical/common/models/dog.model.dart';

import '../rest_api.dart';

abstract class DogService extends RestAPI {
  late List<DogModel> list;
  Future<Response> getAll();

  late String endPointURL;
}

class DogServiceImpl extends RestAPI implements DogService {
  @override
  List<DogModel> list = [];
  String endPointURL = "";
  DogServiceImpl() {
    endPointURL = serverIP + "/v1/442a4801-5715-474a-b6fd-7548ab2f8d20";
  }

  @override
  Future<Response> getAll() async {
    Response? response = await myDioGET(
      url: endPointURL,
    );
    // logger.d(response.data);
    // logger.d(response.statusCode);
    if (response!.statusCode == 200) {
      List<dynamic> temp = response.data["dogs"];
      list.clear();
      temp.forEach((element) {
        list.add(DogModel.fromJson(element));
      });
    }
    return response;
  }






}


class DogServiceFake extends RestAPI implements DogService {
  @override
  late String endPointURL;

  @override
  late List<DogModel> list;





  @override
  Future<Response> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }


}