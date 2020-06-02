import 'package:meta/meta.dart';

@immutable
abstract class GreetingState {}

class InitialGreetingState extends GreetingState {}

class HowdyState extends GreetingState{
  final String greeting;
  HowdyState(this.greeting);
}

class WhatUpState extends GreetingState{
  final String greeting;
  WhatUpState (this.greeting);
}

class YouAreRockGreetState extends GreetingState{
  final String greeting;
  YouAreRockGreetState(this.greeting);
}

class ErrorState extends GreetingState{}
