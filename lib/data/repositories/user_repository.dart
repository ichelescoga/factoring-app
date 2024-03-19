import 'package:developer_company/data/models/common/user_model.dart';

abstract class UserRepository {
  Future<User> loginUser(String email, String password);
}
