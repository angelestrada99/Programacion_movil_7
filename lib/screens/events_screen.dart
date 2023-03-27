import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_1/provider/theme_provider.dart';
import 'package:flutter_1/settings/styles_settings.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/models/evento_model.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_1/database/database_helper.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isDarkModeEnabled = false;
  Map<DateTime, List<EventoModel>>? selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DatabaseHelper? database;
  bool isCalendarView = true;
  EventoModel? evento;

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
    database = DatabaseHelper();
  }

  List<EventoModel> _getEventsfromDay(DateTime date) {
    return selectedEvents![date] ?? [];
  }

  Future<List<EventoModel>> _getEventsfromDayList(DateTime date) async {
    final eventos =
        await database!.getEventsForDay(date.toIso8601String() + 'Z');
    if (eventos != null && eventos.isNotEmpty) {
      return eventos;
    } else {
      return [];
    }
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("EVENTOS"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: isCalendarView
                ? const Icon(Icons.list)
                : const Icon(Icons.calendar_today),
            onPressed: () {
              setState(() {
                isCalendarView = !isCalendarView;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<EventoModel>>(
        future: database!.getAllEventos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            selectedEvents = {};
            for (var evento in snapshot.data!) {
              DateTime fechaEvento = DateTime.parse(evento.fechaEvento!);
              if (selectedEvents![fechaEvento] == null) {
                selectedEvents![fechaEvento] = [];
              }
              selectedEvents![fechaEvento]!.add(evento);
            }
            return isCalendarView
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        TableCalendar(
                          locale: 'es_Es',
                          focusedDay: selectedDay,
                          firstDay: DateTime.utc(2023, 01, 01),
                          lastDay: DateTime.utc(2024, 01, 01),
                          calendarFormat: format,
                          onFormatChanged: (CalendarFormat _format) {
                            setState(() {
                              format = _format;
                            });
                          },
                          startingDayOfWeek: StartingDayOfWeek.sunday,
                          daysOfWeekVisible: true,

                          //Day Changed
                          onDaySelected:
                              (DateTime selectDay, DateTime focusDay) {
                            setState(() {
                              selectedDay = selectDay;
                              focusedDay = focusDay;
                            });
                          },
                          selectedDayPredicate: (DateTime date) {
                            return isSameDay(selectedDay, date);
                          },

                          eventLoader: _getEventsfromDay,
                          //To style the Calendar
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            selectedTextStyle:
                                const TextStyle(color: Colors.white),
                            todayDecoration: BoxDecoration(
                              color: const Color.fromARGB(255, 135, 67, 180),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),

                          headerStyle: HeaderStyle(
                            formatButtonVisible: true,
                            titleCentered: true,
                            formatButtonShowsNext: false,
                            formatButtonDecoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            formatButtonTextStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          calendarBuilders: CalendarBuilders(
                            markerBuilder: (context, date, events) {
                              BoxDecoration? decoration;
                              TextStyle? textStyle;
                              if (events.isNotEmpty) {
                                int daysDifference =
                                    date.difference(DateTime.now()).inDays;
                                EventoModel Eventstatus =
                                    events[0] as EventoModel;
                                bool? completado = Eventstatus.completado;
                                if (daysDifference >= 2 && !completado!) {
                                  decoration = const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.lime,
                                  );
                                  textStyle =
                                      const TextStyle(color: Colors.white);
                                } else if (daysDifference >= 0 &&
                                    daysDifference < 2 &&
                                    !completado!) {
                                  decoration = const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.yellow,
                                  );
                                } else if (daysDifference < 0 && !completado!) {
                                  decoration = const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.red,
                                  );
                                  textStyle =
                                      const TextStyle(color: Colors.white);
                                } else if (daysDifference < 0 && completado! ||
                                    daysDifference >= 0 && completado!) {
                                  decoration = const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.green,
                                  );
                                  textStyle =
                                      const TextStyle(color: Colors.white);
                                }
                              }
                              return Container(
                                width: 22,
                                height: 22,
                                decoration: decoration,
                                child: Center(
                                  child: Text(
                                      events.isNotEmpty ? '${date.day}' : '',
                                      style: textStyle),
                                ),
                              );
                            },
                          ),
                        ),
                        ..._getEventsfromDay(selectedDay).map(
                          (EventoModel event) => ListTile(
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    event.dscEvento.toString(),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/modify',
                                            arguments: event)
                                        .then((value) {
                                      setState(() {
                                        Navigator.pushNamed(context, '/events');
                                      });
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text(
                                                  'Confirmar borrado'),
                                              content: const Text(
                                                  'Deseas borrar el post?'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      database!
                                                          .DELETE(
                                                              'tblEvento',
                                                              event.idEvento!,
                                                              'idEvento')
                                                          .then((value) {
                                                        var msg = value > 0
                                                            ? 'Evento eliminado'
                                                            : 'Ocurrio un error';
                                                        var snackBar = SnackBar(
                                                            content: Text(msg));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                        setState(() {});
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('SI')),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('No'))
                                              ],
                                            ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        const Text('TEMA',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        DayNightSwitcher(
                          isDarkModeEnabled: isDarkModeEnabled,
                          onStateChanged: (isDarkModeEnabled) {
                            isDarkModeEnabled
                                ? theme.setthemeData(
                                    StylesSettings.darkTheme(context))
                                : theme.setthemeData(
                                    StylesSettings.lightTheme(context));
                            this.isDarkModeEnabled = isDarkModeEnabled;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  )
                //VISTA DE LISTA
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 31, // número de días a mostrar en la lista
                          itemBuilder: (context, index) {
                            final day =
                                DateTime.now().add(Duration(days: index));
                            final fecha = DateFormat('yyyy-MM-dd').format(day);
                            return FutureBuilder<List<EventoModel>>(
                              future:
                                  _getEventsfromDayList(DateTime.parse(fecha)),
                              builder: (context, snapshot) {
                                final events = snapshot.data ?? [];
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        DateFormat('EEEE, MMMM d').format(day),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 95, 53, 5)),
                                      ),
                                    ),
                                    if (events.isNotEmpty)
                                      ...events.map(
                                        (event) => ListTile(
                                          title: Row(
                                            children: [
                                              Text(event.dscEvento.toString()),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.visibility),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                          context, '/modify',
                                                          arguments: event)
                                                      .then((value) {
                                                    setState(() {
                                                      Navigator.pushNamed(
                                                          context, '/events');
                                                    });
                                                  });
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                title: const Text(
                                                                    'Confirmar borrado'),
                                                                content: const Text(
                                                                    'Deseas borrar el post?'),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        database!
                                                                            .DELETE(
                                                                                'tblEvento',
                                                                                event.idEvento!,
                                                                                'idEvento')
                                                                            .then((value) {
                                                                          var msg = value > 0
                                                                              ? 'Evento eliminado'
                                                                              : 'Ocurrio un error';
                                                                          var snackBar =
                                                                              SnackBar(content: Text(msg));
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);
                                                                          setState(
                                                                              () {});
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          'SI')),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: const Text(
                                                                          'No'))
                                                                ],
                                                              ));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (events.isEmpty)
                                      const ListTile(
                                        title: Text('Sin evento registrado'),
                                      ),
                                    const Divider(),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: Text("No events found."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("¿Que debemos recordar para este dia?"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text(
                  "Guardar",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 95, 53, 5)),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                    var msg = ('Debes insertar una descripcion al evento');
                    var snackBar = SnackBar(content: Text(msg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {});
                  } else {
                    final evento = EventoModel(
                        dscEvento: _eventController.text,
                        fechaEvento: selectedDay.toIso8601String(),
                        completado: false);
                    database!.INSERT('tblEvento', evento.toMap());
                    _eventController.clear();
                    var msg = ('Evento registrado');
                    var snackBar = SnackBar(content: Text(msg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
        label: const Text("Registrar evento"),
        icon: const Icon(Icons.notification_add_rounded),
      ),
    );
  }
}
