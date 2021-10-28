import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Provider/feedback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageFeedbacks extends StatefulWidget {
  static final routeName = 'ManageFeedbacks';

  @override
  _ManageFeedbacksState createState() => _ManageFeedbacksState();
}

class _ManageFeedbacksState extends State<ManageFeedbacks> {
  final postId = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB788E5),
          title: Text(
            'Feedbacks',
            textAlign: TextAlign.center,
          ),
        ),
        body: FutureBuilder(
            future: Provider.of<Feedbacks>(context, listen: false)
                .fetchAndSetProducts(
                    true, Provider.of<Auth>(context, listen: false).userid),
            builder: (context, snapshot) {
              return Consumer<Feedbacks>(
                  builder: (ctx, feedbackData, child) => feedbackData
                              .feedback.length >
                          0
                      ? GridView.builder(
                          itemCount: feedbackData.feedback.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Order ID",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${feedbackData.feedback[index].oID}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Comments",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${feedbackData.feedback[index].description}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "rating",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${feedbackData.feedback[index].rating}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Email",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${feedbackData.feedback[index].email}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            // MediaQuery.of(context).size.width /
                            // (MediaQuery.of(context).size.height / 1.4)
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ))
                      : Center(child: Text("No Feed available")));
            }));
  }
}
