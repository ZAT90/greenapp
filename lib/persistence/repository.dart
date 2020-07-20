
import 'apiProvider.dart';
import 'package:greenapp/models/people.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<People> fetchAllData() =>
      appApiProvider.fetchAllData();
}
