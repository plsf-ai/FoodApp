import 'package:FoodAp/api_service.dart';
import 'package:FoodAp/pages/signup_page.dart';
import 'package:FoodAp/utilis/ProgressHUD.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

import 'home_page.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String username;
  String password;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20),
                    ],
                  ),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => username = input,
                            validator: (input) => !input.contains('@')
                                ? "Email ID should be valid"
                                : null,
                            decoration: new InputDecoration(
                                hintText: "Email Address",
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.2))),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).accentColor)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Theme.of(context).accentColor,
                                ))),
                        SizedBox(height: 20),
                        new TextFormField(
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.text,
                            onSaved: (input) => password = input,
                            validator: (input) => input.length < 3
                                ? "Password should be more than 3 characters"
                                : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                                hintText: "Password",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).accentColor)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).accentColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.4),
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ))),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });

                              apiService
                                  .loginCustomer(username, password)
                                  .then((ret) {
                                setState(() {
                                  isApiCallProcess = false;
                                });

                                if (ret.data != null) {
                                  print(ret.data.token);
                                  print(ret.data.toJson());
                                  FormHelper.showMessage(
                                    context,
                                    "Food CITY APP ",
                                    "Login Sucessful",
                                    "OK",
                                    () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                        ModalRoute.withName("/Home"),
                                      );
                                    },
                                  );
                                } else {
                                  FormHelper.showMessage(
                                      context,
                                      "Food City App",
                                      "Invalid Login",
                                      "Ok", () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
