import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TicketDetailsView extends StatefulWidget {
  const TicketDetailsView({Key? key}) : super(key: key);

  @override
  _TicketDetailsViewState createState() => _TicketDetailsViewState();
}

class _TicketDetailsViewState extends State<TicketDetailsView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: BlockNavigationBar(
      //   index: 1,
      // ),
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(29.0, 20.0, 35.0, 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const FavoriteEventsView(),
                      // ));
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Ink(
                      height: height * 0.05,
                      width: width * 0.09,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        IconlyLight.arrow_left_2,
                        color: Colors.white,
                        size: height * 0.023,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  AutoSizeText(
                    'ticket',
                    style: titleStyle,
                    stepGranularity: 0.1,
                    maxFontSize: (height * 0.0215).roundToDouble(),
                    minFontSize: (height * 0.0215).roundToDouble(),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.045,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFF181818),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, height * 0.015, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 172.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                            Image.asset('assets/images/ticket_details (1).png'),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Airbeat One Festival',
                          style: ticketDetailsTitleStyle,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0334,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(21.0, 0.0, 25.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: ticketDetailsInfoTitleStyle,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      'Hal Jordan',
                                      style: ticketDetailsInfoValueStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.0388,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date',
                                      style: ticketDetailsInfoTitleStyle,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      '28 July 2021',
                                      style: ticketDetailsInfoValueStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quantity',
                                      style: ticketDetailsInfoTitleStyle,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      '4 Ticket(s)',
                                      style: ticketDetailsInfoValueStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.0388,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time',
                                      style: ticketDetailsInfoTitleStyle,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      '7:00 PM',
                                      style: ticketDetailsInfoValueStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0453,
                      ),
                      Container(
                        height: height * 0.075,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Image.asset(
                            'assets/images/ticket_details (2).png',
                            height: height * 0.06,
                            width: width * 0.65,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0259,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Please scan the barcode at the entry gate',
                            style: ticketDetailsScanInfoStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.0377,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
