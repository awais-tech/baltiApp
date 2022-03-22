import 'package:balti/Model/Resturent.dart';
import 'package:balti/Model/Resturent.dart';

import 'package:balti/Provider/Resturents.dart';
import 'package:balti/Provider/googlemap.dart';
import 'package:balti/Provider/utilities.dart';
import 'package:balti/Widgets/Map.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

class AddResturent extends StatefulWidget {
  static const routeName = '/Addedit-Resturent';

  @override
  _AddResturentState createState() => _AddResturentState();
}

class _AddResturentState extends State<AddResturent> {
  final _priceFocusNode = FocusNode();
  final _DescriptionFocusNode = FocusNode();
  final _image = FocusNode();
  final _imageUrlController = TextEditingController();
  final _TextControl = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool loading = false;
  bool init = true;
  var _editedResturent = Resturent(
      id: '',
      name: '',
      imageUrl: '',
      location: '',
      description: '',
      createdby: '');
  var initial = {
    'description': '',
    'name': '',
    'location': "",
    'imageurl': "",
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
      final id = ModalRoute.of(context)?.settings.arguments;

      if (id != null) {
        _editedResturent = Provider.of<Resturents>(context, listen: false)
            .findById(id as String);
        initial = {
          'name': _editedResturent.name.toString(),
          'description': _editedResturent.description,
          'location': _editedResturent.location,
          'imageurl': _editedResturent.imageUrl,
        };
        _imageUrlController.text = _editedResturent.imageUrl;
      }
    }
    init = false;
    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    setState(() {});
  }

  saveaddress() {
    Navigator.of(context)
        .pushReplacementNamed(Maps.routeName, arguments: "seller");
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

    if (_editedResturent.id != '') {
      try {
        await Provider.of<Resturents>(context, listen: false)
            .updateResturent(_editedResturent);
      } catch (e) {
        print(333);
      }
    } else {
      try {
        await Provider.of<Resturents>(context, listen: false)
            .addResturent(_editedResturent);
      } catch (e) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  content: Text(
                    e.toString(),
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
    final cat = Provider.of<Utilities>(context).categorys;
    final lat = Provider.of<GernateMap>(context, listen: true).lng;
    final long = Provider.of<GernateMap>(context, listen: true).lat;
    if (long != 0.0 && lat != 0.00) {
      initial['location'] = '${lat},${long}';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Resturent'),
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
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: initial['location'] as String,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter location.';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _editedResturent.location = value!;
                        },
                      ),
                    ),
                    IconButton(onPressed: saveaddress, icon: Icon(Icons.save)),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
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
                          _editedResturent.description = value!;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: initial['name'] as String,
                        decoration: InputDecoration(
                          labelText: 'ResturentName',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a ResturentName.';
                          }

                          return null;
                        },
                        onSaved: (newValue) =>
                            _editedResturent.name = newValue!,
                      ),
                    ),
                    // Consumer<Utilities>(
                    //   builder: (ctx, utility, _) => SelectFormField(
                    //     type: SelectFormFieldType.dropdown,
                    //     initialValue: initial["Category"],
                    //     labelText: 'Select Category',
                    //     items: utility.categorys,
                    //     onSaved: (dynamic value) {},
                    //   ),
                    // ),

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
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Image URL'),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              focusNode: _image,
                              onFieldSubmitted: (_) => {saveform},
                              onSaved: (newValue) =>
                                  _editedResturent.imageUrl = newValue!,
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
