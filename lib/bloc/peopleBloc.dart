import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:greenapp/models/people.dart';
import 'package:greenapp/persistence/repository.dart';
import 'package:rxdart/rxdart.dart';

class PeopleBloc implements Bloc {
  Repository _repository = Repository();

  final peopleFetcher = PublishSubject<People>();
  
  
  Stream<People> get listPeople => peopleFetcher.stream;

  Stream<People> fetchAllPeople() async* {
    print('this is being called');
    People peopleResponse = await _repository.fetchAllData();
    print('peopleResponse: '+peopleResponse.toString());
    peopleFetcher.sink.add(peopleResponse);
    yield peopleResponse;
    //peopleFetcher.sink.add(peopleResponse);
  }

  @override
  void dispose() {
    peopleFetcher.close();
  }
}

//final peoplebloc = PeopleBloc();
