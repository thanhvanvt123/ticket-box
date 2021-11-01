import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/ticket.dart';
import 'package:ticket_box/src/pages/transaction/views/ticket_card.dart';
import 'package:ticket_box/src/services/api/ticket_service.dart';

class TicketList extends StatelessWidget {
  int bookingId;
  Size size;
  TicketList({required this.bookingId, required this.size});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Ticket>?>(
      future: TicketService.getAllTickets(bookingId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: dark_background,
              child:Center(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 5,
                    children: 
                        ticketList(snapshot.data!, size)
                        ,
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
  List<Widget> ticketList(List<Ticket> tickets, size) {
    //final sizeOfContext = MediaQuery.of(context).size;
    List<Widget> bookingWidgets = [];
    for (var i = 0; i < tickets.length; i++) {
      bookingWidgets
          .add(TicketCard(ticket: tickets[i], size: size));
    }
    return bookingWidgets;
  }
}