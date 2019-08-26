import 'package:cafeca_consumer/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/gift_card.dart';

import './spiral_button.dart';
import '../widgets/app_bottom_sheet.dart';
import '../widgets/stamp.dart';

enum Mode { Details, Services }

class GiftCardBack extends StatefulWidget {
  final GiftCard giftCard;

  GiftCardBack({
    Key key,
    @required this.giftCard,
  }) : super(key: key);

  @override
  _GiftCardBackState createState() => _GiftCardBackState();
}

class _GiftCardBackState extends State<GiftCardBack> {
  Mode _mode = Mode.Details;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Image.network(
            widget.giftCard.imageUrl,
            fit: BoxFit.cover,
            color: Color(0x77ffffff),
            colorBlendMode: BlendMode.screen,
          ),
        ),
        _mode == Mode.Details
            ? Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white54,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          widget.giftCard.title,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            // 傳送卡片給好友
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white54,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 0, right: 10, left: 10, bottom: 10),
                      child: Text(
                        widget.giftCard.description,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.giftCard.isUsed
                        ? Stamp(
                            shopName: 'xxx',
                            date: '2019-08-26',
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Find service counters',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SpiralButton(
                                  radius: 50.0,
                                  buttonColor: Colors.white60,
                                  onPressed: () {
                                    // print('on Pressed');
                                    setState(() {
                                      _mode = Mode.Services;
                                    });
                                    // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: ListServiceCounters()));
                                  },
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              )
            : Stack(
                children: <Widget>[
                  FutureBuilder(
                    future: widget.giftCard.findServiceCounters(),
                    builder: (ctx, snapshot) => snapshot.data == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: snapshot
                                .data.length, // giftCard.availableShops[i]
                            itemBuilder: (ctx, i) => Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: GestureDetector(
                                child: Container(
                                  height: 100,
                                  decoration:
                                      BoxDecoration(color: Colors.white54),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.giftCard.serviceCounters[i]
                                                ['name'],
                                            style: TextStyle(),
                                          ),
                                          Text(widget.giftCard
                                              .serviceCounters[i]['distance']
                                              .toString()),
                                        ],
                                      ),
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.network(
                                              widget.giftCard.imageUrl),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Scaffold.of(context).showBottomSheet(
                                    (ctx) => AppBottomSheet(
                                      shopName: widget
                                          .giftCard.serviceCounters[i]['name'],
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                                  title: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            text:
                                                                'Are you sure you want to refeed '),
                                                        TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                          text:
                                                              '${widget.giftCard.title} ',
                                                        ),
                                                        TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.grey,
                                                          ),
                                                          text: 'in ',
                                                        ),
                                                        TextSpan(
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                          text:
                                                              '${widget.giftCard.serviceCounters[i]['name']} ',
                                                        ),
                                                        TextSpan(
                                                          text: '? ',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('No'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        print(
                                                            ' ${widget.giftCard.isUsed} ');
                                                      },
                                                    ),
                                                    FlatButton(
                                                        child: Text('Yes'),
                                                        onPressed: () {
                                                          widget.giftCard
                                                              .markUsedStatus(
                                                                  Provider.of<Auth>(
                                                                          context)
                                                                      .token);
                                                          // widget.giftCard
                                                          //     .giveCard(Provider
                                                          //             .of<Auth>(
                                                          //                 context)
                                                          //         .token);
                                                          Navigator.pop(
                                                              context);
                                                          print(
                                                              ' ${widget.giftCard.isUsed} ');
                                                          setState(() {
                                                            _mode =
                                                                Mode.Details;
                                                          });
                                                        }),
                                                  ],
                                                ));
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  ),
                  Column(
                    children: <Widget>[
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SpiralButton(
                          radius: 50.0,
                          buttonColor: Colors.white60,
                          onPressed: () {
                            // print('on Pressed');
                            setState(() {
                              _mode = Mode.Details;
                            });
                            // Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: ListServiceCounters()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ],
    );
  }
}
