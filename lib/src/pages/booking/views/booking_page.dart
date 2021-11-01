import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/utils/utils.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class BookingPage extends StatefulWidget {
  Event? event;
  BookingPage({this.event});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late FixedExtentScrollController _scrollController;
  SharedStates sharedStates = Get.find();
  Account? account;
  Event? _event;
  double? total;
  int index = 0;
  late int _currentQuantity;
  int maxOfTicket = 10; // số vé tối đa có thể book

  @override
  void initState() {
    _event = widget.event!;
    total = _event!.price;
    _currentQuantity = 1;
    _scrollController =
        FixedExtentScrollController(initialItem: _currentQuantity);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    account = sharedStates.account;
    final quantityController = TextEditingController();

    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: dark_background,
      appBar: AppBar(
        title: Text('Booking'),
        centerTitle: true,
        backgroundColor: dark_background,
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(25),
              child: Stack(
                children: <Widget>[
                  //widget ticket
                  Container(
                      child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: _event!.imageUrl.toString(),
                      fit: BoxFit.cover,
                      height: size.height * 0.25,
                      width: size.width - 15 * 2,
                    ),
                  )),
                  Positioned(
                    top: size.height * 0.25,
                    left: 0,
                    right: 0,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        color: float_element_color,
                        height: size.height * 0.25,
                        width: size.width - 15 * 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _event!.eventName.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '   ' + _event!.groupName.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(children: [
                                Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  color: secondary_color,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                ),
                                Icon(
                                  Icons.location_city_outlined,
                                  color: secondary_color,
                                  
                                )
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                Text(
                                  parseDate2(_event!.timeOccur.toString()),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                SizedBox(
                                  width: size.width * 0.4 - 92,
                                ),
                                Text(
                                  _event!.location.toString(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ]),
                            ])),
                  ),

                  Positioned(
                      top: size.height * 0.5,
                      right: 0,
                      left: 0,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          height: size.height * 0.27,
                          width: size.width - 15 * 2,
                          decoration: BoxDecoration(
                            color: Color(0x7030444E),
                            // color: float_element_color,
                            border: Border.all(
                                width: 1, color: float_element_color),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Column(children: [
                            Row(
                              children: List.generate(
                                  150 ~/ 6,
                                  (index) => Expanded(
                                        child: Container(
                                          color: index % 2 == 0
                                              ? Colors.transparent
                                              : dark_background,
                                          height: 2,
                                        ),
                                      )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ticket Price',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Expanded(child: SizedBox()),
                                /***********
                                 *TICKET PRICE
                                 **********/
                                Text(
                                  '\$ 10' + '    ', //THAY BẰNG event.price
                                  style: Theme.of(context).textTheme.subtitle2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Number of ticket',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Expanded(child: SizedBox()),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              secondary_color),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              float_element_color),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      )),
                                    ),
                                    child: Text(
                                      /***********
                                 *NUMBER OF TICKET
                                 **********/
                                      '$_currentQuantity',
                                      // style:
                                      //     Theme.of(context).textTheme.subtitle2,
                                    ),
                                    onPressed: () {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) =>
                                              CupertinoActionSheet(
                                                actions: [buildNumberPicker()],
                                                cancelButton:
                                                    CupertinoActionSheetAction(
                                                  child: Text('Done'),
                                                  onPressed: () {
                                                    //_scrollController.dispose();
                                                    setState(() {
                                                      _currentQuantity =
                                                          index + 1;
                                                    });
                                                    _scrollController =
                                                        FixedExtentScrollController(
                                                            initialItem: index);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ));
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: dark_background,
                                  border: Border.all(
                                      width: 1, color: float_element_color),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                children: [
                                  /***********
                                 *TOTAL OF THE TRANSACTION 
                                 **********/
                                  Text(
                                    'Total',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '\$ ' + (_currentQuantity * 10).toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            )
                          ]))),

                  Positioned(
                      top: size.height * 0.5,
                      right: 0,
                      child: CustomPaint(
                        painter: DrawCircle(),
                      )),
                  Positioned(
                      top: size.height * 0.5,
                      left: 0,
                      child: CustomPaint(
                        painter: DrawCircle(),
                      )),

                  Container(
                    height: size.height,
                  ),
                  Positioned(
                    top: size.height * 0.75,
                    left: size.width * 0.18,
                    child: Container(
                      width: size.width * 0.5,
                      height: 55,
                      child: ElevatedButton.icon(
                        icon: Text(
                          'Booking   ',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(accent_green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          )),
                        ),
                        label: FaIcon(
                          FontAwesomeIcons.angleDoubleRight,
                          size: 18,
                        ),
                        /******************
                       BOOK TICKET HEREEEEEE
                       *****************/
                        onPressed: () {
                          //
                        },
                      ),
                    ),
                  )
                ],
              ))),
    ));
  }

  Widget buildNumberPicker() => Container(
      decoration: BoxDecoration(
        color: float_element_color,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            height: 350,
            child: StatefulBuilder(
                builder: (context, setState) => CupertinoPicker(
                      looping: true,
                      scrollController: _scrollController,
                      itemExtent: 50,
                      onSelectedItemChanged: (index) => setState(() {
                        this.index = index;
                        _currentQuantity = index + 1;
                      }),
                      children: [
                        for (var i = 1; i <= maxOfTicket; i++)
                          Center(
                            child: Text(
                              i.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: ((_currentQuantity) == i)
                                      ? accent_green
                                      : Colors.white),
                            ),
                          )
                      ],
                      selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                        background: accent_green.withOpacity(0.2),
                      ),
                    )))
      ]));
}

//build numberpicker

//draw circle for ticket widget
class DrawCircle extends CustomPainter {
  late Paint _paint;

  DrawCircle() {
    _paint = Paint()
      ..color = dark_background
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), 18.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
