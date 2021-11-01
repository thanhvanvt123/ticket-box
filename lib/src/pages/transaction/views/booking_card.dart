import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/booking.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/pages/transaction/views/booking_details_page.dart';
import 'package:ticket_material/ticket_material.dart';

class BookingCard extends StatelessWidget {
  final Booking? booking;
  final Size? size;

  const BookingCard({@required this.booking, @required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //borderRadius: BorderRadius.circular(15),
        onLongPress: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingDetailsPage(bookingId: booking!.bookingId!)));
        },
        child: Container(
          child: Padding(
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: TicketMaterial(
            useAnimationScaleOnTap: true,
            shadowSize: 2.5,
              radiusBorder: 10,
              colorShadow: dark_background,
              flexLefSize: 35,
              flexRightSize: 55,
              height: 160,
              leftChild: buildLeft(),
              rightChild: buildRight(context),
              colorBackground: float_element_color),
        )));
  }

  Widget buildLeft() {
    return Container(height: 150, child: buildImage());
  }

  Widget buildImage() {
    return ClipRRect(
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading.gif',
        image: booking!.event!.imageUrl!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildRight(context) {
    Event? _event = booking!.event;
    return Container(
        padding: EdgeInsets.all(10),
        width: 60,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _event!.eventName.toString(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Expanded(child: SizedBox()),
                Text(
                  booking!.quantity.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  ' ticket(s)',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ]),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Expanded(child: SizedBox()),
                Text('\$ ' + booking!.total.toString(), style: TextStyle(fontSize: 20, color: accent_green, fontWeight: FontWeight.bold),),
              ]),

              // SizedBox(
              //   height: 30,
              // ),
              Text('Booking time:'),
              SizedBox(
                height: 5,
              ),
              Text(
                parseDate2(booking!.createDate.toString()),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ]));
  }
}
