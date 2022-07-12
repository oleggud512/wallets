import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

typedef BlocBuilder<T> = T Function();
typedef BlocDisposer<T> = Function(T);

abstract class Bloc {
  
  // StreamController<Event> _eventCont = BehaviorSubject<Event>();
  // Stream<Event> get _outEvent => _eventCont.stream;
  // Sink<Event> get inEvent => _eventCont.sink;

  // StreamController<State> _stateCont = BehaviorSubject<State>();
  // Stream<State> get outState => _stateCont.stream;
  // Sink<State> get _inState => _stateCont.sink;

  // Bloc(initEvent) {
  //   _outEvent.listen((event) {_handleEvent(event);});
  //   inEvent.add(initEvent);
  // }

  // @required
  // void _handleEvent(Event event) {}
  // @required
  void dispose();
}

class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider({
    Key? key,
    required this.blocBuilder,
    // required this.bloc,
    // required this.blocDispose,
    required this.child,
  }) : super(key: key);

  final Widget child;
  // blocBuilder -- функция, которая вернет тебе тип T, который, в свою
  // очередь, наследуется от BlocBase (blocBuilder() --> T)
  final BlocBuilder<T> blocBuilder;
  // final T bloc;
  // в blocDispose пихаем Т и он, должен выполнить его метод dispose()
  // (Т.dispose()) ( мы, типа, это определяем когда создаем приложение ->
  //    blocBuilder: () => SomeBloc(),
  //    blocDispose: (SomeBloc bloc) => bloc?.dispose(),
  // )
  // final BlocDisposer<T> blocDispose;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends Bloc>(BuildContext context) {
    _BlocProviderInherited<T> provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited<T>;
    
    return provider.bloc;
  }
}

class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  late T bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.blocBuilder();
    // bloc = widget.bloc;
  }

  @override
  void dispose() {
    // if (widget.blocDispose != null) {
    //   widget.blocDispose(bloc);
    // } else {
    //   bloc.dispose();
    // }
    print("D I S P O S E");
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}

// class BlocProvider<T extends Bloc> extends StatefulWidget {
//   final Widget child;
//   final T bloc;

//   const BlocProvider({Key? key, required this.bloc, required this.child})
//       : super(key: key);

//   // 2
//   static T of<T extends Bloc>(BuildContext context) {
//     final BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>()!;
//     return provider.bloc;
//   }

//   @override
//   State createState() => _BlocProviderState();
// }

// class _BlocProviderState extends State<BlocProvider> {
  
//   // 4
//   @override
//   Widget build(BuildContext context) => widget.child;

//   // 5
//   @override
//   void dispose() {
//     print("D I S P O S E");
//     widget.bloc.dispose();
//     super.dispose();
//   }
// }