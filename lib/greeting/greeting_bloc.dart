import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {

  static const List <String> greetList = ["Howdy", "What's Up", "You're Rock!"];

  @override
  GreetingState get initialState => InitialGreetingState();

  @override
  Stream<GreetingState> mapEventToState(
    GreetingEvent event,
  ) async* {
    if(event is HowdyEvent) {
      yield InitialGreetingState ();
      final message = await getData(0);
      yield HowdyState(message);
    }
    if (event is WhatUpEvent ) {
      yield InitialGreetingState ();
      final message = await getData(1);
      yield WhatUpState(message);
    }
    if (event is YouAreRockEvent) {
      yield InitialGreetingState();
      final message = await getData(2);
      yield YouAreRockGreetState(message);
    }
  }

  Future<String> getData(int index) async{
    await Future.delayed(Duration(seconds: 1));
    return greetList[index];
  }
}
