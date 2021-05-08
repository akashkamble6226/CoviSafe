import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/precaution_dummy_data.dart';
import '../models/current_status_dummy_data.dart';

import '../models/daily_status_dummy_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildFirstRow(context),
              SizedBox(height: 10),
              buildStatusRow(context),
              SizedBox(height: 20),
              buildThirdRow(context),
              SizedBox(height: 20),
              buildDailyReportList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDailyReportList() {
    return Container(
      height: 350,
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: dailyStatus.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    color: Theme.of(context).accentColor,
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dailyStatus[index].day,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Heart Rate -' + dailyStatus[index].heartRate,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Oxygen Level -' + dailyStatus[index].oxyLevel,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: HexColor('#BFF9DC'),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  dailyStatus[index].severStatus,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: HexColor(
                                        dailyStatus[index].txtColor,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column buildThirdRow(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).accentColor,
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Analyse health of your children.'),
                        content: Text(
                            'You need simply enter daily data about heart rate and oxygen level'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Center(
                              child: Text('Ok'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(
                    Icons.info,
                    color: HexColor('#ffffff'),
                    size: 18,
                  ),
                ),
              ),
              Text('Third wave will target the children\'s .',
                  style: Theme.of(context).textTheme.headline5),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Text('- Indian Doctor\'s .',
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildStatusRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Current Scenario In India ',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 100,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: statusList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildText(context, statusList[index].title,
                        statusList[index].count);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row buildFirstRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stay Home, Stay Safe',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Cause Its you who will bring this virus down or let it grow !',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: HexColor('#ffffff'),
                                  borderRadius: BorderRadius.circular(2)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Precautions are better than cure.',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              'Yes but if you dont agree then this is the time to confirm it.',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: precuationList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 100,
                                      height: 50,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: Theme.of(context).primaryColor,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              precuationList[index].img,
                                              width: 100,
                                              height: 80,
                                            ),
                                            SizedBox(height: 10),
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(left:2),
                                                child: Text(
                                                  precuationList[index].details,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Image.asset(
                'assets/images/novirus.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).accentColor,
      title: Text(
        'CoviSafe',
        style: Theme.of(context).textTheme.headline1,
      ),
      leading: Icon(
        Icons.menu,
        color: HexColor('#ffffff'),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
            radius: 15,
            child: Center(
              child: Text(
                'A',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildText(dynamic context, String title, String count) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      // shape: Border.all(
      //   color: HexColor('#ffffff'),
      // ),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                count,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
