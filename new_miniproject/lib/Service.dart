import 'package:dio/dio.dart';
import 'package:new_miniproject/ModelHacker/ModelHacker.dart';

import 'BaseApi.dart';

class Services extends BaseApi {
  Future getSingleUserData() async {
    Response response = await get(url: 'https://reqres.in/api/users/2');
    return HackerModel.populate(response.data);
  }
  Future getListUser() async {
    Response response = await get(
      url: 'https://reqres.in/api/users',
      params: {
        'page': 2,
      },
    );
    return HackerList.populate(response.data);
  }
  Future loginUser(String email, String password) async{
    try{
    Response response = await post(url: "https://reqres.in/api/login",data: {"email": email, "password": password});
    return response.statusCode;

    }catch(e){

    }
  }
}