import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/landscape_container.dart';
import '../const/portrait_container.dart';
import '../const/row_styling.dart';
import '../const/stat_row.dart';
import '../const/text_style.dart';

class DetailScreen extends StatelessWidget {
  // this data and index is passed from home screen
  final dynamic data;
  const DetailScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,

            child: orientation == Orientation.portrait ? portraitContainer(data) : landscapeContainer(data),
            )
            ),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))
            ),

            child: Column(
              children: [
                TabBar(
                    labelColor: black,
                    unselectedLabelColor: grey,
                    tabs: [
                  Tab(text: "About",),
                  Tab(text: "Base Stats",)
                ]),
                Expanded(
                  child: TabBarView(children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          normalText(
                            text: data["xdescription"],
                            color: black,
                            size: 16),

                          SizedBox(height: 10,),

                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: width - 100,
                              child: Card(
                                color: lightGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          headingText(text: "Height", color: grey, size: 16),
                                          SizedBox(height: 6,),
                                          headingText(text: data['height'], color: grey, size: 16),
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          headingText(text: "Weight", color: grey, size: 16),
                                          SizedBox(height: 6,),
                                          headingText(text: data['weight'], color: grey, size: 16),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),
                          headingText(text: "Breeding", color: Colors.black, size: 16),
                          SizedBox(height: 10,),
                          RowStyling(text: "Category", value: data["category"]),
                          RowStyling(text: "Egg Groups", value: data["egg_groups"]),

                        ],
                      ),
                    ),

                    // @nd TabBar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          statRow(text: "HP", value: data["hp"]),
                          statRow(text: "Attack", value: data["attack"]),
                          statRow(text: "Defence", value: data["defense"]),
                          statRow(text: "Speed", value: data["speed"]),
                        ],
                      ),
                    )

                  ]),
                ),
              ],
            ),
            )),
          ],
        ),
      ),
    );
  }
}

