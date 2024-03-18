import 'dart:async';
import 'dart:ui';

class Debouncer{
  final Duration delayed; 
  Timer?_timer;
  Debouncer({required this.delayed});
  void run(VoidCallback calllback){
    _timer?.cancel();
    _timer=Timer(delayed,calllback);
  }
}

    