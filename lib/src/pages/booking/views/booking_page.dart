import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/models/event.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:get/get.dart';
import 'package:fw_ticket/fw_ticket.dart';
import 'package:numberpicker/numberpicker.dart';

class BookingPage extends StatefulWidget {
  Event? event;
  BookingPage({this.event});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  SharedStates sharedStates = Get.find();
  Account? account;
  Event? _event;
  double? total;
  int _currentValue = 3;

  @override
  void initState() {
    _event = widget.event!;
    total = _event!.price;
    super.initState();
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
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  //widget ticket
                  Ticket(
                    outerRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      height: size.height * 0.3,
                      width: size.width - 15 * 2,
                      placeholder: 'assets/images/loading.gif',
                      image: _event!.imageUrl.toString(),
                    ),
                  ),
                  Ticket(
                      innerRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      //outerRadius: BorderRadius.all(Radius.circular(20)),
                      child: Column(children: [
                        Container(
                          height: size.height * 0.25,
                          color: float_element_color,
                        ),

                        //fake divider
                        Row(
                          children: List.generate(
                              150 ~/ 7,
                              (index) => Expanded(
                                    child: Container(
                                      color: index % 2 == 0
                                          ? Colors.transparent
                                          : float_element_color,
                                      height: 2,
                                    ),
                                  )),
                        ),
                      ])),

                  Ticket(
                    innerRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    outerRadius: BorderRadius.all(Radius.circular(5)),
                    //dashedBottom: true,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
                      height: size.height * 0.3,
                      color: float_element_color,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ticket Price',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                '\$ ' + 10.toString(),
                                style: Theme.of(context).textTheme.subtitle1,
                              ), //price of ticket
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Quantity',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Expanded(child: SizedBox()),
                              ElevatedButton(
                                child: Text('$_currentValue'),
                                onPressed: () {
                                  
                                },
                              )
                              // NumberPicker(
                              //   selectedTextStyle: Theme.of(context).textTheme.subtitle2,
                              //   itemHeight: 20,
                              //   value: _currentValue,
                              //   minValue: 1,
                              //   maxValue: 10,
                              //   haptics: true,
                              //   onChanged: (value) =>
                              //       setState(() => _currentValue = value),
                              // ),

                              // Container(
                              //     child: TextField(
                              //   decoration: InputDecoration(
                              //     labelText: 'number of ticket',
                              //   ),
                              //   controller: quantityController,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       var quantity = double.tryParse(value) ?? 0;
                              //       total = quantity * 10;
                              //     });
                              //   },
                              // )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: size.width - 15 * 2 - 20 * 2,
                              height: size.height * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(children: [
                                Text('Total'),
                                Expanded(child: SizedBox()),
                                Text('$total'),
                              ]))
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    ));
  }

  // void numberpickerBottomSheet(context) {
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Positioned(
  //           top: 200,
  //           right: 10,
  //           child: NumberPicker(
  //             value: _currentValue,
  //             minValue: 1,
  //             maxValue: 10,
  //             step: 10,
  //             onChanged: (value) => setState(() =>  _currentValue = value),
  //           ),
  //         );
  //       });
  // }

  

  
}
