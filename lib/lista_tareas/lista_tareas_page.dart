import 'package:flutter/material.dart';
import 'package:flutterexamples/lista_tareas/lista_tareas.dart';
import 'package:flutterexamples/lista_tareas/tareas_controller.dart';

class ListaTareasPage extends StatefulWidget {
//
  @override
  _ListaTareasPageState createState() => _ListaTareasPageState();
}

class _ListaTareasPageState extends State<ListaTareasPage> {
  final controller = TareasController();

  @override
  void initState() {
    // controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    controller.addTarea();

    return Scaffold(
      body: _BuilderBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addTarea(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _BuilderBody extends StatelessWidget {
  final controller = TareasController();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Lista de tareas',
            style: textTheme.bodyText1,
          ),
          Divider(),
          SizedBox(height: 16),
          // TextField(
          //   autofocus: true,
          //   expands: true,
          //   decoration: InputDecoration(hintText: 'Ingrese su tarea'),
          // ),
          ValueListenableBuilder(
              valueListenable: controller.valueList,
              builder: (_, List<Tareas> value, __) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (_, index) => Text('${value[index].text} ${value[index].isCompleted}'),
                  )),
          SizedBox(height: 16),
        ],
      ),
    ));
  }
}
