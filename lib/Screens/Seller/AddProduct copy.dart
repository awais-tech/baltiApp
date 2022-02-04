import 'package:balti/Model/meal.dart';
import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Provider/utilities.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:balti/Widgets/camera.dart';
import 'package:balti/Widgets/image_upload.dart';

import 'dart:io';

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
  bool loading = true;
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
      createdby: '');
  var initial = {
    'price': 0.toString(),
    'description': '',
    'ResturentName': '',
    'Category': "Fast Food",
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
  void didChangeDependencies() async {
    if (init) {
      setState(() {
        loading = true;
      });
      final id = ModalRoute.of(context)?.settings.arguments as Map;
      await Provider.of<Utilities>(context, listen: false)
          .fetchAndSetProducts();

      if (id["id"] != null && id["id"] != "") {
        _editedProduct = Provider.of<BaltiMeals>(context, listen: false)
            .findById(id["id"] as String);
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
    setState(() {
      loading = false;
    });
    init = false;
    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    setState(() {});
  }

  var upload = false;
  XFile? _userImageFile;
  void _pickedImage(XFile image) {
    _userImageFile = image;
    setState(() {
      upload = true;
    });
  }

  void saveform() async {
    var form = _form.currentState!.validate();
    final id = ModalRoute.of(context)?.settings.arguments as Map;
    if (!form) {
      return;
    }

    _form.currentState!.save();
    setState(() {
      loading = true;
    });

    if (_editedProduct.id != '') {
      try {
        if (upload) {
          final ref =
              FirebaseStorage.instance.ref().child(_userImageFile!.name);
          print(File(_userImageFile!.path));
          await ref.putFile(File(_userImageFile!.path));
          final download = await ref.getDownloadURL();
          await Provider.of<BaltiMeals>(context, listen: false)
              .updateProduct(_editedProduct, download);
        } else {
          final ref =
              FirebaseStorage.instance.ref().child(_userImageFile!.name);
          print(File(_userImageFile!.path));
          await ref.putFile(File(_userImageFile!.path));
          final download = await ref.getDownloadURL();
          await Provider.of<BaltiMeals>(context, listen: false)
              .updateProduct(_editedProduct);
        }
      } catch (e) {
        print(333);
      }
    } else {
      try {
        final ref = FirebaseStorage.instance.ref().child(_userImageFile!.name);
        print(File(_userImageFile!.path));
        await ref.putFile(File(_userImageFile!.path));
        final download = await ref.getDownloadURL();
        await Provider.of<BaltiMeals>(context, listen: false)
            .addProduct(_editedProduct, id["name"], download);
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
    final cat = Provider.of<Utilities>(context, listen: false).categorys;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        backgroundColor: Color(0xffB788E5),
        actions: [IconButton(onPressed: saveform, icon: Icon(Icons.save))],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.green,
              semanticsLabel: 'Please Wait',
            ))
          : Padding(
              padding: const EdgeInsets.all(2.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
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
                              createdby: _editedProduct.createdby,
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
                    ),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Consumer<Utilities>(
                        builder: (ctx, utility, _) => SelectFormField(
                          type: SelectFormFieldType.dropdown,
                          initialValue: initial["Category"],
                          labelText: 'Select Category',
                          items: utility.categorys,
                          onSaved: (dynamic value) {
                            _editedProduct = Meal(
                                title: _editedProduct.title,
                                createdby: _editedProduct.createdby,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: _editedProduct.imageUrl,
                                id: _editedProduct.id,
                                ResturentName: _editedProduct.ResturentName,
                                Category: value,
                                Dilvery: _editedProduct.Dilvery,
                                duration: _editedProduct.duration,
                                isFavorite: _editedProduct.isFavorite);
                          },
                        ),
                      ),
                    ),
                    // TextFormField(
                    //   initialValue: initial['Category'] as String,
                    //   decoration: InputDecoration(labelText: 'Category'),
                    //   textInputAction: TextInputAction.next,
                    //   keyboardType: TextInputType.text,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter a Ctageory.';
                    //     }

                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _editedProduct = Meal(
                    //         title: _editedProduct.title,
                    //         createdby: _editedProduct.createdby,
                    //         price: _editedProduct.price,
                    //         description: _editedProduct.description,
                    //         imageUrl: _editedProduct.imageUrl,
                    //         id: _editedProduct.id,
                    //         ResturentName: _editedProduct.ResturentName,
                    //         Category: value!,
                    //         Dilvery: _editedProduct.Dilvery,
                    //         duration: _editedProduct.duration,
                    //         isFavorite: _editedProduct.isFavorite);
                    //   },
                    // ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: initial['Dilvery'] as String,
                        decoration:
                            InputDecoration(labelText: 'Delivery Charges'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Delivery Charges.';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Meal(
                              title: _editedProduct.title,
                              createdby: _editedProduct.createdby,
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
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
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
                              createdby: _editedProduct.createdby,
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
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: initial['price'] as String,
                        decoration: InputDecoration(labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _priceFocusNode,
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
                              createdby: _editedProduct.createdby,
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
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: initial['description'] as String,
                        decoration: InputDecoration(labelText: 'Description'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Description.';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Meal(
                              title: _editedProduct.title,
                              createdby: _editedProduct.createdby,
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
                    ),
                    UserImagePicker(_pickedImage),
                    camera(_pickedImage),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: <Widget>[
                    //     Container(
                    //       width: 100,
                    //       height: 100,
                    //       margin: EdgeInsets.only(
                    //         top: 8,
                    //         right: 10,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           width: 1,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       child: _imageUrlController.text.isEmpty
                    //           ? Text('Enter a URL')
                    //           : FittedBox(
                    //               child: Image.network(
                    //                 _imageUrlController.text,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //     ),
                    //     Expanded(
                    //       child: TextFormField(
                    //         decoration: InputDecoration(labelText: 'Image URL'),
                    //         keyboardType: TextInputType.url,
                    //         textInputAction: TextInputAction.done,
                    //         controller: _imageUrlController,
                    //         focusNode: _image,
                    //         onFieldSubmitted: (_) => {saveform},
                    //         onSaved: (value) {
                    //           _editedProduct = Meal(
                    //               title: _editedProduct.title,
                    //               createdby: _editedProduct.createdby,
                    //               price: _editedProduct.price,
                    //               description: _editedProduct.description,
                    //               imageUrl: value!,
                    //               id: _editedProduct.id,
                    //               ResturentName: _editedProduct.ResturentName,
                    //               Category: _editedProduct.Category,
                    //               Dilvery: _editedProduct.Dilvery,
                    //               duration: _editedProduct.duration,
                    //               isFavorite: _editedProduct.isFavorite);
                    //         },
                    //         validator: (value) {
                    //           if (value!.isEmpty) {
                    //             return 'Please enter an image URL.';
                    //           }
                    //           if (!value.startsWith('http') &&
                    //                   !value.startsWith('https') ||
                    //               value.contains('www')) {
                    //             return 'Please enter a valid URL.';
                    //           }
                    //           if (!value.endsWith('.png') &&
                    //               !value.endsWith('.jpg') &&
                    //               !value.endsWith('.jpeg')) {
                    //             return 'Please enter a valid image URL.';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
