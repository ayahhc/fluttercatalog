import 'package:flutter/material.dart';
import 'package:catalog_app/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? username;
  String name = "";
  bool Changebtn = false;
  final _formkey = GlobalKey<FormState>();
  
  Movetohome(BuildContext context) async {
     final form = _formkey.currentState; // this is your GlobalKey<FormState> that you specified and set to the key of your Form Widget.
    if (form?.validate() == true) { // form.validate() will call all the validator functions that you've passed to your inputfields
      form?.save(); // This will call all the onSaved functions that you passed to your forms.
    
    setState(() {
      Changebtn = true;
    });

    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoute.homeroute);
    setState(() {
      Changebtn = false;
    });
    }
    // // understand code
    // int? home;

    // if (home != null && home.isEven == true) {
    //   return "hey";
    // } else {
    //   return "bye";
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assest/images/hey.png",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30.0),
              Text(
                "Welcome $name !!!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Your name", labelText: "Username"),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "Username Cannot be Empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return "Password cannot be Empty";
                        }else if(value.length <8){
                          return "password must be less then 8";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(Changebtn ? 50 : 8),
                      child: InkWell(
                        onTap: () => Movetohome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: Changebtn ? 50 : 150,
                          height: 50,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: Changebtn
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                          // decoration: BoxDecoration(
                          //   shape: Changebtn ? BoxShape.circle :BoxShape.rectangle,
                          //   color: Colors.green,

                          // )
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoute.homeroute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     // ignore: prefer_const_constructors
                    //     minimumSize: Size(200, 50),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
