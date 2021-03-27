import 'env.dart';

class ApiUrl {
  ApiUrl._();

  static String login = "${Env.BASE_URL}/login";
  static String blogList = "${Env.BASE_URL}/blogs";
}
