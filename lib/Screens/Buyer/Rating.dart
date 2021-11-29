import 'package:balti/Provider/feedback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_beautiful_popup/main.dart';

class Rating extends StatefulWidget {
  static final routename = 'rating';
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  void bottomsheet(context, content) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(10),
            child: Text('Description:$content',
                softWrap: true, style: TextStyle(fontWeight: FontWeight.bold)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final ofb =
        Provider.of<Feedbacks>(context, listen: false).orderfeedback(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('rating'),
        backgroundColor: Color(0xffB788E5),
      ),
      body: ofb.length > 0
          ? ListView.separated(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(ofb[index].rating.toString()),
                      radius: 40,
                    ),
                    title: Text(
                      ofb[index].email.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(ofb[index].description.toString(),
                        overflow: TextOverflow.ellipsis),
                    trailing: IconButton(
                        onPressed: () =>
                            {bottomsheet(context, ofb[index].description)},
                        icon: Icon(Icons.details_outlined)),
                  ),
                );
              },
              itemCount: ofb.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            )
          : Center(child: Text('No Rating yet')),
    );
  }
}
