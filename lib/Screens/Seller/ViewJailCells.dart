// import 'package:flutter/material.dart';

// class ViewResturent extends StatefulWidget {
//   final comp;
//   static final routeName = 'ViewResturent';

//   ViewResturent(this.comp);

//   @override
//   _ViewResturentState createState() => _ViewResturentState();
// }

// class _ViewResturentState extends State<ViewResturent> {
//   var _expanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 10,
//       margin: EdgeInsets.all(10),
//       child: Column(
//         children: <Widget>[
//           ListTile(
//             leading: FittedBox(
//               child: Text(
//                 'Resturent Name: ${widget.comp.data()['PrisonerNo']}',
//                 softWrap: true,
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             ),
//             trailing: Container(
//               width: 100,
//               child: Row(
//                 children: [
//                   widget.comp.data()['left'] == "0"
//                       ? IconButton(
//                           color: Colors.red[900],
//                           tooltip: "Capacity is Full",
//                           icon: Icon(Icons.add),
//                           onPressed: null,
//                         )
//                       : IconButton(
//                           color: Colors.red[900],
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             var id = widget.comp.data()['PrisonerNo'];
//                             var capacity = widget.comp.data()['left'];
//                             var ids = widget.comp.id;
//                             Navigator.of(context)
//                                 .pushNamed(AddJailRecord.routename, arguments: {
//                               "ids": id,
//                               "idd": ids,
//                               "capacity": capacity,
//                             });
//                           },
//                         ),
//                   IconButton(
//                     icon: Icon(Icons.list_rounded),
//                     color: Colors.red[900],
//                     onPressed: () {
//                       var ids = widget.comp.id;
//                       Navigator.of(context)
//                           .pushNamed(ViewPrisoner.routeName, arguments: ids);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   child: FittedBox(
//                     fit: BoxFit.contain,
//                     child: Text(
//                       'Total Capacity: ${widget.comp.data()['TotalCapacity']}',
//                       softWrap: true,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: FittedBox(
//                     fit: BoxFit.contain,
//                     child: Text(
//                       'Capacity Left: ${widget.comp.data()["left"]}',
//                       softWrap: true,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
