//class HackersModel {
//
//  String nama;
//  String alamat;
//  String id;
//  //String avatar;
//  HackersModel({this.nama, this.alamat, this.id});
//}
class HackerModel {
  HackerModel({this.id, this.email, this.firstName, this.lastName, this.avatar});
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  factory HackerModel.populate(data){
    return HackerModel(
      id: data['data']['id'],
      email: data['data']['email'],
      firstName: data['data']['first_name'],
      lastName: data['data']['last_name'],
      avatar: data['data']['avatar'],
    );
  }
  factory HackerModel.populateList(data) {
    return HackerModel(
      id: data['id'],
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      avatar: data['avatar'],
    );
  }

}
class HackerList {
  final List<HackerModel> hackerList;
  factory HackerList.populate(data) {
    List<HackerModel> models = List<HackerModel>();
    models = data['data'].map<HackerModel>((item) {
      return HackerModel.populateList(item);
    }).toList();
    return HackerList(hackerList: models);
  }
  HackerList({this.hackerList});
}


