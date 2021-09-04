import 'package:balti/Model/meal.dart';
import 'package:balti/Screens/DetailScreen.dart';
import 'package:balti/Screens/addtocart.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BaltiItem extends StatelessWidget {
  // final imageUrl;
  // final title;
  // final id;
  // final duration;
  // final Dilvery;
  // final Category;
  // final ResturentName;
  // final favourite;
  // BaltiItem(this.id, this.title, this.imageUrl, this.duration, this.Dilvery,
  //     this.Category, this.ResturentName, this.favourite);
  // void selectMeal(BuildContext context, id) {
  //   Navigator.of(context)
  //       .pushNamed('/MealsDetail', arguments: {'id': id, 'image': imageUrl});
  // }

  @override
  Widget build(BuildContext context) {
    final loadedMenu = Provider.of<Meal>(
      context,
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: loadedMenu.id);
            },
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    loadedMenu.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      border: Border.all(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: 120,
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 5,
                    ),
                    child: FittedBox(
                      child: Text(
                        loadedMenu.title,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '${loadedMenu.duration} minute duration ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ListTile(
              // leading: Icon(Icons.ac_unit_outlined),
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  loadedMenu.ResturentName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: FittedBox(child: Text(loadedMenu.Category)),
                    padding: EdgeInsets.symmetric(vertical: 2),
                  ),
                  Container(
                    child: FittedBox(
                      child: Text(
                        loadedMenu.Dilvery,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 2),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  loadedMenu.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                color: Colors.red,
                onPressed: () {
                  loadedMenu.toggleFavoriteStatus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Item selected as a ${loadedMenu.isFavorite ? 'Favourite' : 'unFavourite'}',
                      ),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          loadedMenu.toggleFavoriteStatus();
                        },
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
  }
}
