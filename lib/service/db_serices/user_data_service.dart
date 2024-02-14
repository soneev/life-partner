import 'package:hive/hive.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';

class UserDataService {
  final Box<dynamic> userDataDB;

  UserDataService(this.userDataDB);

  List<UserData> getUsers() {
    // Retrieve user data from the Hive box
    List<UserData> users = userDataDB.values.map((dynamic user) {
      return UserData(
        username: user['username'],
        age: user['age'],
        address: user['address'],
        gender: user['gender'],
        height: user['height'],
        weight: user['weight'],
        email: user['email'],
        imageUrl: user['imageUrl'],
        description: user['description'],
      );
    }).toList();

    return users;
  }
}
