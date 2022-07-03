import 'package:flutter/material.dart';
import 'package:innocart_front/domain/model/order.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';
import 'package:innocart_front/presentation/style/primary_text.dart';
import 'package:image_picker/image_picker.dart';

class MyAddPost extends StatefulWidget {
  const MyAddPost({Key? key}) : super(key: key);

  @override
  State<MyAddPost> createState() => _MyAddPost();
}

class _MyAddPost extends State<MyAddPost> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String productName = "";
  double weight = 0.0;
  String description = "";
  double price = 0.0;
  double reward = 0.0;
  String imagepath = "";
  String imageStatus = 'no image';
  final ImagePicker imgpicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    //            padding: const EdgeInsets.all(16.0),
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 50,
                      // width: double.infinity,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          openImage();
                        },
                        child: const PrimaryText(
                          text: "Add image",
                          color: AppColors.black,
                          size: 20,
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  PrimaryText(text: imageStatus),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Product name',
                        labelStyle: TextStyle(color: AppColors.lightGray),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      setState(() {
                        productName = value;
                        // productNameList.add(productName);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        productName = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Product name cannot be empty';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'Product name cannot contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(color: AppColors.lightGray),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      setState(() {
                        description = value;
                        // productNameList.add(productName);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Description cannot be empty';
                      } return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Weight (g.)',
                          labelStyle: TextStyle(color: AppColors.lightGray),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.contains(RegExp(r'^[a-zA-Z\-]'))) {
                          return 'Use only numbers!';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        setState(() {
                          weight = double.parse(value);
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          weight = double.parse(value);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Price (\$)',
                        labelStyle: TextStyle(color: AppColors.lightGray),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.contains(RegExp(r'^[a-zA-Z\-]'))) {
                        return 'Use only numbers!';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        price = double.parse(value);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        price = double.parse(value);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Reward (\$)',
                        labelStyle: TextStyle(color: AppColors.lightGray),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.contains(RegExp(r'^[a-zA-Z\-]'))) {
                        return 'Use only numbers!';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        reward = double.parse(value);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        reward = double.parse(value);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.primary),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          _submit();
                        }
                      },
                      child: const PrimaryText(
                        text: "Submit",
                        color: AppColors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imageStatus = 'image uploaded';
        imagepath = pickedFile.path;
      }
    } catch (e) {
      imageStatus = "error";
    }
  }

  void _submit() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your information has been submitted'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Align(
                    alignment: Alignment.topLeft,
                    child: PrimaryText(
                      text: "Product name and characteristics",
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                    text: "$productName $weight $description",
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: PrimaryText(
                      text: "Price Reward",
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: PrimaryText(
                      text: "$price $reward", color: AppColors.black),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('Cancel'),
                  onPressed: () async {
                    Navigator.pop(context);
                  }, // so the alert dialog is closed when navigating back to main page
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('OK'),
                  onPressed: () {
                    Order newOrder = Order(
                        id: -1,
                        productName: productName,
                        weight: weight,
                        description: description,
                        price: price,
                        reward: reward,
                        status: 'CREATED',
                        picture: imagepath,
                        delivererID: -1,
                        delivererProfile: -1,
                        customerProfile: -1);
                    OrderRepoModule.orderRepository().addOrder(newOrder);
                    Navigator.of(context).pop(); // Close the dialog
                    FocusScope.of(context)
                        .unfocus(); // Unfocus the last selected input field
                    _formKey.currentState?.reset();
                    Navigator.pushNamed(context, 'dashboard');
                    // Empty the form fields
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }
}
