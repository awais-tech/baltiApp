import 'package:balti/Model/meal.dart';
import 'package:balti/Provider/MealsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _priceFocusNode = FocusNode();
  final _DescriptionFocusNode = FocusNode();
  final _image = FocusNode();
  final _imageUrlController = TextEditingController();
  final _TextControl = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool loading = false;
  bool init = true;
  var _editedProduct = Meal(
    id: '',
    title: '',
    ResturentName: '',
    Category: '',
    Dilvery: '',
    imageUrl: '',
    duration: 0,
    price: 0,
    description: '',
  );
  var initial = {
    'price': 0.toString(),
    'description': '',
    'ResturentName': '',
    'Category': '',
    'Dilvery': '',
    'duration': 0.toString(),
  };
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _DescriptionFocusNode.dispose();
    _image.removeListener(_updateImageUrl);
    super.dispose();
  }

  @override
  void initState() {
    _image.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (init) {
      final id = ModalRoute.of(context)?.settings.arguments;

      if (id != null) {
        _editedProduct = Provider.of<BaltiMeals>(context, listen: false)
            .findById(id as String);
        initial = {
          'price': _editedProduct.price.toString(),
          'description': _editedProduct.description,
          'ResturentName': _editedProduct.ResturentName,
          'Category': _editedProduct.Category,
          'Dilvery': _editedProduct.Dilvery,
          'duration': _editedProduct.duration.toString(),
        };
        _imageUrlController.text = _editedProduct.imageUrl;
        _TextControl.text = _editedProduct.title;
      }
    }
    init = false;
    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    setState(() {});
  }

  void saveform() async {
    var form = _form.currentState!.validate();
    if (!form) {
      return;
    }

    _form.currentState!.save();
    setState(() {
      loading = true;
    });

    if (_editedProduct.id != '') {
      try {
        await Provider.of<BaltiMeals>(context, listen: false)
            .updateProduct(_editedProduct);
      } catch (e) {
        print(333);
      }
    } else {
      try {
        await Provider.of<BaltiMeals>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (e) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  content: Text(
                    'Something Goes wrong ?',
                  ),
                  title: Text(
                    'Warning',
                    style: TextStyle(color: Colors.red),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                ));
      }
    }
    setState(() {
      loading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [IconButton(onPressed: saveform, icon: Icon(Icons.save))],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.green,
              semanticsLabel: 'Please Wait',
            ))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      controller: _TextControl,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description.';
                        }
                        if (value.length < 10) {
                          return 'Should be at least ${10 - _TextControl.text.length.toInt()} characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: value!,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: _editedProduct.ResturentName,
                            Category: _editedProduct.Category,
                            Dilvery: _editedProduct.Dilvery,
                            duration: _editedProduct.duration,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: initial['ResturentName'] as String,
                      decoration: InputDecoration(labelText: 'ResturentName'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a ResturentName.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: value!,
                            Category: _editedProduct.Category,
                            Dilvery: _editedProduct.Dilvery,
                            duration: _editedProduct.duration,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: initial['Category'] as String,
                      decoration: InputDecoration(labelText: 'Category'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Ctageory.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: _editedProduct.ResturentName,
                            Category: value!,
                            Dilvery: _editedProduct.Dilvery,
                            duration: _editedProduct.duration,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: initial['Dilvery'] as String,
                      decoration: InputDecoration(labelText: 'Dilvery'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a .';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: _editedProduct.ResturentName,
                            Category: _editedProduct.Category,
                            Dilvery: value!,
                            duration: _editedProduct.duration,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: initial['duration'] as String,
                      decoration: InputDecoration(labelText: 'duration'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a price.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: _editedProduct.ResturentName,
                            Category: _editedProduct.Category,
                            Dilvery: _editedProduct.Dilvery,
                            duration: double.parse(value!) as int,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      initialValue: initial['price'] as String,
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_DescriptionFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a price.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: _editedProduct.title,
                            price: double.parse(value!) as int,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: _editedProduct.ResturentName,
                            Category: _editedProduct.Category,
                            Dilvery: _editedProduct.Dilvery,
                            duration: _editedProduct.duration,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Description'),
                      initialValue: initial['description'] as String,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _DescriptionFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_image);
                      },
                      onSaved: (value) {
                        _editedProduct = Meal(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: value!,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            ResturentName: _editedProduct.ResturentName,
                            Category: _editedProduct.Category,
                            Dilvery: _editedProduct.Dilvery,
                            duration: _editedProduct.duration,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _image,
                            onFieldSubmitted: (_) => {saveform},
                            onSaved: (value) {
                              _editedProduct = Meal(
                                  title: _editedProduct.title,
                                  price: _editedProduct.price,
                                  description: _editedProduct.description,
                                  imageUrl: value!,
                                  id: _editedProduct.id,
                                  ResturentName: _editedProduct.ResturentName,
                                  Category: _editedProduct.Category,
                                  Dilvery: _editedProduct.Dilvery,
                                  duration: _editedProduct.duration,
                                  isFavorite: _editedProduct.isFavorite);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                      !value.startsWith('https') ||
                                  value.contains('www')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
