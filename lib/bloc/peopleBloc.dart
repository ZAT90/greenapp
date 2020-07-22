import 'package:bloc_provider/bloc_provider.dart';
import 'package:greenapp/models/people.dart';
import 'package:greenapp/persistence/repository.dart';

class PeopleBloc implements Bloc {
  Repository _repository = Repository();

  Stream<People> fetchAllPeople() async* {
    People peopleResponse = await _repository.fetchAllData();
    yield peopleResponse;
  }

  @override
  void dispose() {
    // peopleFetcher.close();
  }
}

