import 'package:dio/dio.dart';
import 'package:queritelpractical/common/models/cat.model.dart';

import '../rest_api.dart';

abstract class CatService extends RestAPI {
  late List<CatModel> list;
  Future<Response> getAll();
  late String endPointURL;
}

class CatServiceImpl extends RestAPI implements CatService {
  @override
  List<CatModel> list = [];
  String endPointURL = "";
  CatServiceImpl() {
    endPointURL = serverIP + "/v1/77290441-d8e9-483f-80a2-a336a3364bbe";
  }

  @override
  Future<Response> getAll() async {
    Response? response = await myDioGET(
      url: endPointURL,
    );
    // logger.d(response.data);
    // logger.d(response.statusCode);
    if (response!.statusCode == 200) {
      List<dynamic> temp = response.data["cats"];
      list.clear();
      temp.forEach((element) {
        list.add(CatModel.fromJson(element));
      });
    }
    return response;
  }
}

class CatServiceFake extends RestAPI implements CatService {
  @override
  late String endPointURL;

  @override
  late List<CatModel> list;

  @override
  Future<Response> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
