part of 'models.dart';

class UserModel {
  String id;
  String email;
  String name;

  UserModel({
    this.id,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> object) => UserModel(
        id: object["id"].toString(),
        name: object["first_name"] + object["last_name"],
      );

  static Future<List<UserModel>> getUsers(String page) async {
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)["data"];

    List<UserModel> users = [];

    for (int i = 0; i < listUser.length; i++) {
      users.add(UserModel.fromJson(listUser[i]));
      return users;
    }
  }
}
