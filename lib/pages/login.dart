import 'package:flutter/material.dart';
import 'package:catalog_app/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool Changebtn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assest/images/bird.png",
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password", labelText: "Password"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () async {
                
                      
                        setState(() {
                          Changebtn = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                         Navigator.pushNamed(context, MyRoute.homeroute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: Changebtn ? 50 : 150,
                      height: 50,
                      // color: Colors.green,
                      alignment: Alignment.center,
                      child: Changebtn ? Icon(Icons.done,
                      color: Colors.white,):
                      Text(
                        "LOGIN",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      decoration: BoxDecoration(
                        shape: Changebtn ? BoxShape.circle :BoxShape.rectangle,
                        color: Colors.green,
                        // borderRadius: BorderRadius.circular(Changebtn ? 20 :8),
                      )
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
    );
  }
}
