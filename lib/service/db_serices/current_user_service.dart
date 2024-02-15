import 'package:hive/hive.dart';
import 'package:lifepartner/model/hive_model/users_data_model.dart';

class CurrentUserService {
  final Box<dynamic> currentUserDb;

  CurrentUserService(this.currentUserDb);

  UserData? getUserByUsername(String username) {
    // Find the user with the specified username
    dynamic user = currentUserDb.values.firstWhere(
      (user) => user['username'] == username,
      orElse: () => null,
    );

    // Return UserData object if found, otherwise return null
    return user != null
        ? UserData(
            username: user['username'],
            age: user['age'],
            address: user['address'],
            gender: user['gender'],
            height: user['height'],
            weight: user['weight'],
            email: user['email'],
            imageUrl: user['imageUrl'],
            description: user['description'],
          )
        : null;
  }
}
