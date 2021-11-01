

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/models/ticket.dart';
import 'package:ticket_material/ticket_material.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final Size size;

  const TicketCard(
      {required this.ticket, required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //borderRadius: BorderRadius.circular(15),
        onLongPress: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QRReview(
                    ticket: ticket,
                  )));
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: TicketMaterial(
              radiusBorder: 10,
              colorShadow: dark_background,
              flexLefSize: 35,
              flexRightSize: 55,
              height: 125,
              leftChild: buildLeft(),
              rightChild: buildRight(context),
              colorBackground: float_element_color),
        ));
  }

  Widget buildLeft() {
    return Padding(padding: EdgeInsets.all(7), child: buildQRCode());
  }

  Widget buildQRCode() {
    return PrettyQr(
      elementColor: dark_background,
      image: NetworkImage(ticket.event!.group!.groupImageUrl.toString()),
      typeNumber: 3,
      size: 200,
      data:
          '${ticket.eventId}-${ticket.ticketId}-${parseDate2(ticket.createDate.toString())}',
      errorCorrectLevel: QrErrorCorrectLevel.M,
      //roundEdges: true,
    );
  }

  Widget buildRight(context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: 60,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.event!.eventName.toString(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              
              Expanded(child: SizedBox()),
              Text('Booking time:'),
              SizedBox(
                height: 5,
              ),
              Text(
                parseDate2(ticket.createDate.toString()),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ]));
  }
}

class QRReview extends StatelessWidget {
  Ticket ticket;
  QRReview({required this.ticket});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: PrettyQr(
        elementColor: Colors.white60,
        image: AssetImage('assets/images/setting.png'),
        typeNumber: 3,
        size: size.width - 30,
        data:
            '${ticket.eventId}-${ticket.ticketId}-${parseDate2(ticket.createDate.toString())}',
        errorCorrectLevel: QrErrorCorrectLevel.M,
        //roundEdges: true,
      ),
    )));
  }
}
