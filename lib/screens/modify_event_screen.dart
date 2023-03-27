import '../models/evento_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/database/database_helper.dart';

class ModifyEvent extends StatefulWidget {
  const ModifyEvent({Key? key}) : super(key: key);

  @override
  _ModifyEventState createState() => _ModifyEventState();
}

class _ModifyEventState extends State<ModifyEvent> {
  EventoModel? event;
  DatabaseHelper database = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    final txtdscEvent = TextEditingController();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      event = ModalRoute.of(context)!.settings.arguments as EventoModel;
      txtdscEvent.text = event!.dscEvento.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar evento'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Descripción del evento:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: txtdscEvent,
                maxLines: 5,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Completado:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: event!.completado!,
                    onChanged: (value) {
                      setState(() {
                        event!.completado = value;
                        event!.dscEvento = txtdscEvent.text.toString();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      database!
                          .UPDATE(
                              'tblEvento',
                              {
                                'idEvento': event!.idEvento,
                                'dscEvento': txtdscEvent.text.toString(),
                                'fechaEvento': event!.fechaEvento,
                                'completado': event!.completado,
                              },
                              'idEvento')
                          .then((value) {
                        var msg = value > 0
                            ? 'Evento modificado'
                            : 'Ocurrio un error';
                        var snackBar = SnackBar(content: Text(msg));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
