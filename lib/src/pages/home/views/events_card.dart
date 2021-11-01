import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/pages/home/views/event_details_page.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class EventCard extends StatelessWidget {
  Event event;
  Size size;
  EventCard({required this.event, required this.size});

  @override
  Widget build(BuildContext context) {
    print('iam loading event ${event.eventName} from group ${event.groupId}, ${event.numberOfTickets} booked');
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventDetails(
                  event: event,
                )));
      },
      
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        width: size.width - 2 * 10, //padding = 10
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: float_element_color,
        ),
        child: Column(
          children: [
            if (event.imageUrl != '')
              Container(
                // width: size.width - 20,
                height: size.height * 0.16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(event.imageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(event.groupName.toString(), //fill it later :))
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                        ),

                        //đánh dấu event đã đc book
                        // if (event.flag!)
                        //   Icon(
                        //     FontAwesomeIcons.flag,
                        //     color: Colors.red,
                        //     size: 16,
                        //   )
                      ],
                    ),
                    Text(
                      event.eventName.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Location: ' + event.location.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Icon(
                          FontAwesomeIcons.calendarAlt,
                          size: 14,
                          color: Colors.white,
                        ),
                        Text(
                          ' ' + parseDate(event.timeOccur.toString()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
