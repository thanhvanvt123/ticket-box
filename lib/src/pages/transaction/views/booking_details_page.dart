import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/booking.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/models/ticket.dart';
import 'package:ticket_box/src/pages/transaction/views/ticket_card.dart';
import 'package:ticket_box/src/pages/transaction/views/ticket_list.dart';
import 'package:ticket_box/src/services/api/booking_service.dart';

class BookingDetailsPage extends StatelessWidget {
  final int bookingId;
  const BookingDetailsPage({required this.bookingId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder<Booking>(
        future: BookingService.getBookingById(bookingId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: dark_background,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    buildEventHeader(snapshot.data!.event!, size),
                    buildEventDetails(snapshot.data!.event!, size),
                    TicketList(bookingId: bookingId,size: size),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }

  

  Widget buildEventDetails(Event event, size) {
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Location:',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '${event.location}',
          style: TextStyle(color: secondary_color),
        ),
       
      ]),
    );
  }

  Widget buildEventHeader(Event event, size) {
    final isOccured =
        (compareDate(event.timeOccur, DateTime.now()) == 0) ? true : false;

    return Stack(children: [
      Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: event.imageUrl!,
            width: size.width,
            height: size.height * 0.5,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: size.height * 0.5,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.black45,
              Colors.black26,
            ],
          ),
        ),
      ),
      Positioned(
        width: 260,
        top: 80,
        left: 20,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            event.eventName.toString(),
            //textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            (isOccured) ? 'On going 🔥' : 'Up coming 💣',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Icon(
              FontAwesomeIcons.calendarAlt,
              color: Colors.white,
            ),
            Text(
              '  ' + parseDate(event.timeOccur.toString()),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ])
        ]),
      ),
      Positioned(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white70),
        ),
      ),

      //UNIVERSITY LOGO
      Positioned(
          right: 20,
          top: size.height * 0.5 - 80,
          child: Image.asset(
            'assets/images/fpt-logo.jpg',
            height: 40,
          )),
    ]);
  }
}
