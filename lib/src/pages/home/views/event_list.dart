import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/pages/home/views/events_card.dart';
import 'package:ticket_box/src/services/api/event_service.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
//stream listener for search()
StreamController<String> streamController = BehaviorSubject();


class EventList extends StatefulWidget {
  EventList(this.search, this.stream);
  final String? search;
  final Stream<String> stream;
  

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList>{
  late Future<List<Event>?> eventsFound = EventService.getAllEvent('');

  void mySetState(String search) {
    setState(() {
      eventsFound = EventService.getAllEvent(search);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.stream.listen((search) {
      mySetState(search);
    });
     //WidgetsBinding.instance!.addObserver(this);
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<List<Event>?>(
      future: eventsFound,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: dark_background,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 22,
                    children: snapshot.data!.length > 0
                         ? 
                        eventList(snapshot.data!)
                        : [
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                            Center(
                                child: Column(children: [
                              Image.asset(
                                'assets/images/not-found.png',
                                height: size.height * 0.4,
                              ),
                              SizedBox(
                                height: size.height * 0.08,
                              ),
                              Text(
                                'Nothing was found',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                               SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Try changing the filters and search again.',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ]))
                          ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> eventList(List<Event> events) {
    final sizeOfContext = MediaQuery.of(context).size;
    List<Widget> eventWidgets = [];
    for (var i = 0; i < events.length; i++) {
      eventWidgets.add(EventCard(event: events[i], size: sizeOfContext));
    }
    return eventWidgets;
  }
}
