import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_my_bloc/greeting/bloc.dart';
import 'package:test_my_bloc/greeting/greeting_bloc.dart';

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Simple BLoC Test"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DisplayWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
                    color: Colors.blueAccent,
                    child: Text(
                      "Howdy",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<GreetingBloc>(context)..add(HowdyEvent());
                    }
                ),
                FlatButton(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
                    color: Colors.green,
                    child: Text(
                      "What's up!",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<GreetingBloc>(context)..add(WhatUpEvent());
                    }
                ),
                FlatButton(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
                    color: Colors.red,
                    child: Text(
                      "You're Rock!",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<GreetingBloc>(context)..add(YouAreRockEvent());
                    }
                ),
              ],
            )
          ],
        )
    );
  }
}

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GreetingBloc, GreetingState>(
      builder: (context, state){
        String _greet;
        if(state is InitialGreetingState){
          return Container(
            padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
          );
        }
        if (state is HowdyState) {
          _greet = state.greeting;
        }
        if (state is WhatUpState) {
          _greet = state.greeting;
        }
        if (state is YouAreRockGreetState) {
          _greet = state.greeting;
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Text(
            "$_greet",
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        );
      },

    );

  }
}