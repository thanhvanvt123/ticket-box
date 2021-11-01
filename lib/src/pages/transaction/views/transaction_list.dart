import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/booking.dart';
import 'package:ticket_box/src/services/api/booking_service.dart';
import 'package:ticket_box/src/services/api/event_service.dart';

import 'booking_card.dart';

class TransactionList extends StatefulWidget {
  final int? userId;
  const TransactionList({@required this.userId});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late int userId;

  @override
  Widget build(BuildContext context) {
    userId = widget.userId!;
    print(userId);

    var size = MediaQuery.of(context).size;
    return FutureBuilder<List<Booking>?>(
      //use bookingService to load user's transaction
      //check lại cái service coi nó ổn hong nha, t đang sửa đại thuii
      future: BookingService.getAllBooking(userId),
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
                    children: 
                        bookingList(snapshot.data!)
                        ,
                  ),
                ),
              ),
            ),
          );
        } else {
          //không có data
          //set delay gì thì tùy m nhó :> t đang để đại làm cho lẹ thôi
          return Center(child: CircularProgressIndicator(),)
          
          /********
          TRƯỜNG HỢP CHƯA CÓ TRANSACTION
          ********/
          // Center(
          //   heightFactor: size.height*0.25,
          //     child: Column(
          //       children: [
          //       SizedBox(height: size.height*0.2,),
          //   Image.asset(
          //     'assets/images/no-booking.png',
          //     height: size.height * 0.4,
          //   ),
          //   SizedBox(
          //     height: size.height * 0.08,
          //   ),
          //   Text(
          //     'Nothing was found',
          //     style: Theme.of(context).textTheme.bodyText1,
          //   ),
          //   SizedBox(
          //     height: 15,
          //   ),
          //   Text(
          //     'Look like you haven\'t made any bookings yet.',
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ]))
          ;
        }
      },
    );
  }

  List<Widget> bookingList(List<Booking> bookings) {
    final sizeOfContext = MediaQuery.of(context).size;
    List<Widget> bookingWidgets = [];
    for (var i = 0; i < bookings.length; i++) {
      bookingWidgets
          .add(BookingCard(booking: bookings[i], size: sizeOfContext));
    }
    return bookingWidgets;
  }
}
