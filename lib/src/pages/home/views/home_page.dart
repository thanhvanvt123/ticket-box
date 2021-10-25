import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/pages/home/controllers/home_controller.dart';
import 'package:ticket_box/src/pages/home/views/event_list.dart';
import 'package:ticket_box/src/pages/home/views/search_bar.dart';
import 'package:ticket_box/src/widgets/custom_bottom_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: HomeSearchBar(),
          preferredSize: Size.fromHeight(5),
        ),
        backgroundColor: float_element_color,
      ),
      backgroundColor: dark_background,
      body: InkWell(
        
        child: EventList(" ", streamController.stream),
      ),
      bottomNavigationBar: CustomBottombar(),
    );
  }

  // Alert custom content
  // _onAlertWithCustomContentPressed(context) {
  //   Size screenSize = MediaQuery.of(context).size;
  //   Alert(
  //       context: context,
  //       title: "Reply feed back",
  //       style: AlertStyle(titleStyle: TextStyle(fontSize: 20)),
  //       content: Container(
  //         width: screenSize.width * 0.8,
  //         child: Card(
  //           elevation: 0,
  //           margin: EdgeInsets.only(top: 25),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(5),
  //             side: BorderSide(
  //               color: Colors.grey,
  //               width: 0.4,
  //             ),
  //           ),
  //           child: TextField(
  //             textInputAction: TextInputAction.done,
  //             maxLines: 5,
  //             onChanged: (value) {
  //               // controller.saveFeedback(value);
  //             },
  //             decoration: InputDecoration(
  //               contentPadding: new EdgeInsets.fromLTRB(15, 5, 10, 10),
  //               labelText: 'Content reply',
  //             ),
  //           ),
  //         ),
  //       ),
  //       buttons: [
  //         DialogButton(
  //           onPressed: () => {Navigator.pop(context)},
  //           child: Text(
  //             "Send",
  //             style: TextStyle(color: Colors.white, fontSize: 20),
  //           ),
  //         )
  //       ]).show();
  // }
}
