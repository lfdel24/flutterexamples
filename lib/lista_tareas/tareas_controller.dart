import 'package:flutter/foundation.dart';
import 'package:flutterexamples/custom_value_notifier.dart';
import 'package:flutterexamples/lista_tareas/lista_tareas.dart';

class TareasController {
  //https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart
  static final TareasController _singleton = TareasController._internal();

  factory TareasController() {
    return _singleton;
  }

  TareasController._internal();

  //
  ValueNotifier<List<Tareas>> valueList = ValueNotifier([]);

  init() {
    this.valueList = ValueNotifier<List<Tareas>>([]);
  }

  //
  void addTarea() {
    var tarea = Tareas('Leonardo de la cruz', true);
    //https://www.woolha.com/tutorials/dart-using-triple-dot-spread-operator-examples
    this.valueList.value = [...valueList.value, tarea];
    //OR
    //this.valueList.value = List.of(valueList.value)..add(tarea);
  }

  dispose() {
    // this.valueList.value = [];
    // this.valueList.dispose();
  }
}
