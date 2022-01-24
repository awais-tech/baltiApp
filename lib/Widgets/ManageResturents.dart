import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Screens/Seller/AddProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageResturents extends StatelessWidget {
  final String title;
  final String imageUrl;
  final id;

  ManageResturents(this.title, this.imageUrl, this.id);

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  print(id);
                  Navigator.of(context)
                      .pushNamed(AddProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text(
                        'Do you want to remove the item ?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                            print(2);
                          },
                        ),
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () async {
                            try {
                              await Provider.of<BaltiMeals>(context,
                                      listen: false)
                                  .deleteProduct(id);
                              Navigator.of(ctx).pop(true);
                            } catch (error) {
                              scaffold.showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Deleting failed!',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
