import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ticket_box/src/pages/booking/views/booking_page.dart';

class EventDetails extends StatelessWidget {
  Event event;

  EventDetails({required this.event});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isOccured =
        (compareDate(event.timeOccur, DateTime.now()) == 0) ? true : false;
    try {
      return Scaffold(
        backgroundColor: dark_background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60)),
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
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black26,
                        Colors.black45,
                        Colors.black54,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: 260,
                  top: 80,
                  left: 20,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.eventName.toString(),
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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

                Positioned(
                    top: size.height * 0.5 - 30,
                    left: 25,
                    child: Center(
                      child: ElevatedButton.icon(
                        icon: Text(
                          'Booking   ',
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(accent_green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                        ),
                        label: FaIcon(
                          FontAwesomeIcons.angleDoubleRight,
                          size: 15,
                        ),
                        /******************
                       BOOK TICKET HEREEEEEE
                       *****************/
                       //đang còn navigate bằng tay :> gắn route vô giúp nhó
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BookingPage(
                                    event: event,
                                  )));
                        },
                      ),
                    )),
                Container(
                  height: size.height * 0.55,
                ),
              ]),

              GFProgressBar(
                padding: EdgeInsets.symmetric(horizontal: 10),
                animation: true,
                lineHeight: 7,
                percentage: 0.3,
                backgroundColor: secondary_color,
                progressBarColor: (isOccured) ? Colors.orange : accent_green,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            event.numberOfTickets.toString() +
                                ' TICKET SOLD', //number of post
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: accent_green),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            event.numberOfBookings.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(
                            Icons.people_alt_outlined,
                            color: accent_green,
                          )
                        ],
                      ),
                      Row(children: [
                        Text(
                          'over 100 limited tickets',
                          style: TextStyle(
                              color: secondary_color), //number of post
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          'booked',
                          style: TextStyle(
                              color: secondary_color), //number of post
                        ),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Location:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${event.location}',
                        style: TextStyle(color: secondary_color),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Description:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${event.description}',
                        style: TextStyle(color: secondary_color),
                      ),
                    ]),
              ),
              // Image.asset(
              //   isFlag
              //       ? 'assets/images/already.png'
              //       : 'assets/images/notyet.png',
              //   height: size.height * 0.25,
              // ),
              // SizedBox(
              //   height: 7,
              // ),
              // Column(children: [
              //   Text(
              //     isFlag
              //         ? 'Bạn đã viết bài đánh giá cho chiến dịch này!'
              //         : 'Bạn chưa viết bài đánh giá cho chiến dịch này?',
              //     style: TextStyle(
              //         fontSize: 15,
              //         color: Colors.lightBlue,
              //         fontWeight: FontWeight.w500),
              //   ),
              //   SizedBox(
              //     height: 20,
              //   ),
              //   (!isEnd || (isEnd & isFlag))
              //       ? SizedBox(
              //           height: 60,
              //           width: size.width,
              //           child: Row(
              //             children: [
              //               Container(
              //                 padding: EdgeInsets.fromLTRB(20, 22, 0, 20),
              //                 decoration: BoxDecoration(
              //                   color: Colors.lightBlue,
              //                 ),
              //                 child: Text(
              //                   (isFlag)
              //                       ? 'Xem bài viết của bạn'
              //                       : 'Viết bài ngay',
              //                   style: TextStyle(
              //                       fontSize: 15, color: Colors.white),
              //                 ),
              //               ),
              //               Expanded(
              //                 child: SizedBox(
              //                     child: Container(
              //                   padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
              //                   decoration: BoxDecoration(
              //                     color: Colors.lightBlue,
              //                   ),
              //                 )),
              //               ),
              //               FlatButton(
              //                 height: 60,
              //                 minWidth: 40,
              //                 //onPressed: (){},
              //                 color: Colors.white,
              //                 textColor: Colors.lightBlue,
              //                 child: Icon(
              //                   isFlag
              //                       ? FontAwesomeIcons.arrowRight
              //                       : Icons.create_outlined,
              //                 ),
              //                 onPressed: () {
              //                   //view post in campaign
              //                   Navigator.of(context).push(MaterialPageRoute(
              //                       builder: (context) => CreatePost(
              //                             campaign: campaign,
              //                             reviewerId: reviewerId,
              //                             token: token,
              //                           )));
              //                 },
              //               )
              //             ],
              //           ),
              //         )
              //       : SizedBox(
              //           height: 20,
              //         )
              //]),
            ],
          ),
        ),
      );
    } catch (e) {
      print(e);
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
