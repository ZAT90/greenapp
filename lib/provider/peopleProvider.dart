import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:greenapp/bloc/peopleBloc.dart';

class PeopleProvider extends BlocProvider<PeopleBloc>{
  PeopleProvider({
    Widget child,
  }) : super(
          creator: (context, _bag) => PeopleBloc(),
          child: child,
        );

  static PeopleBloc of(BuildContext context) => BlocProvider.of(context);
}