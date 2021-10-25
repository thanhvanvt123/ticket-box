import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/group.dart';
import 'package:ticket_box/src/pages/home/views/event_list.dart';
import 'package:ticket_box/src/services/api/group_service.dart';

class HomeSearchBar extends StatefulWidget {
  @override
  _HomeSearchBarState createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final searchController = TextEditingController();
  bool isSearchAll = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<List<Group>?>(
        future: GroupService.getAllGroup(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 15),
                        height: size.height * 0.075,
                        child: TextFormField(
                          enableSuggestions: true,
                          controller: searchController,
                          onFieldSubmitted: (text) {
                            searchController.clear();
                            streamController.add(text);
                          },
                          style:
                              TextStyle(color: secondary_color, fontSize: 18),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: secondary_color, fontSize: 18),
                            hoverColor: secondary_color,
                            contentPadding: EdgeInsets.only(top: 5),
                            hintText: "Search event",
                            prefixIcon: Icon(
                              Icons.search,
                              color: secondary_color,
                            ),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton(
                        padding: EdgeInsets.only(right: 10),
                        color: Color(0xF030444E),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                            decoration: BoxDecoration(
                                color: accent_green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            padding: EdgeInsets.all(7),
                            child: Icon(
                              FontAwesomeIcons.slidersH,
                              size: 25,
                              color: Colors.white,
                            )),
                        itemBuilder: (context) => [
                              for (var i = 0; i < snapshot.data!.length; i++)
                                PopupMenuItem(
                                    child: Row(children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot
                                            .data![i].groupImageUrl
                                            .toString()),
                                      ),
                                      //Expanded(child: SizedBox()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        snapshot.data![i].groupName.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    value: snapshot.data![i].groupId,
                                    onTap: () {
                                      setState(() {
                                        isSearchAll = false;
                                      });
                                      streamController.add(
                                          snapshot.data![i].groupId.toString());
                                    }),
                              PopupMenuItem(
                                  child: Row(children: [
                                    Checkbox(
                                      
                                      value: isSearchAll,
                                      onChanged: (value) {
                                        setState(() {
                                          isSearchAll = value!;
                                        });
                                        streamController.add('');
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      
                                    ),
                                    //Expanded(child: SizedBox()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'All club',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                  onTap: () {
                                    setState(() {
                                      isSearchAll = true;
                                    });
                                    streamController.add('');
                                  })
                            ]),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
        });
  }
}
