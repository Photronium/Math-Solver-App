import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../pages/CreateAccountPage.dart';
import '../pages/NotificationsPage.dart';
import '../pages/ProfilePage.dart';
import '../pages/SearchPage.dart';
import '../pages/TimeLinePage.dart';
import '../pages/UploadPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:device_info/device_info.dart';

final GoogleSignIn gSignIn = GoogleSignIn();
final usersReference = Firestore.instance.collection("users");
final postReference = Firestore.instance.collection("posts");
final commentReference = Firestore.instance.collection("comments");
final DateTime timestamp = DateTime.now();
final timelineReference = Firestore.instance.collection("timeline");
final posstReference = Firestore.instance.collection("posst");

User currentUser;

class ForumMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Forum PSE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData
          (
          scaffoldBackgroundColor: Colors.black,
          dialogBackgroundColor: Colors.black,
          primarySwatch: Colors.grey,
          accentColor: Colors.black,
          cardColor: Colors.white70,
        ),
        home: ForumPage()
    );
  }
}


class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  bool isSignedIn = false;
  PageController pageController;
  int getPageIndex = 0;
  void initState(){
    super.initState();
    pageController = PageController();
    gSignIn.onCurrentUserChanged.listen((gSignInAccount) {
      controlSignIn(gSignInAccount);
    },onError: (gError){
      print("Error message: " + gError);
    });
    gSignIn.signInSilently(suppressErrors: false).then((gSignInAccount){
      controlSignIn(gSignInAccount);
    }).catchError((gError){
      print("Error message: " + gError);
    });
  }
  controlSignIn(GoogleSignInAccount signInAccount) {
    if(signInAccount != null){
      setState(() {
        isSignedIn = true;
      });
    }
    else {
      setState(() {
        isSignedIn = false;
      });
    }
  }
  loginUser(){
    gSignIn.signIn();
    isSignedIn = true;
  }
  logoutUser(){
    gSignIn.signOut();

  }


  static Future<List<String>> getDeviceDetails() async {
    String deviceName;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    var build = await deviceInfoPlugin.androidInfo;
    deviceName = build.model;
    identifier = build.androidId;  //UUID for Android
    return [deviceName,identifier];
  }

  saveUserInfo() async{
    final GoogleSignInAccount gCurrentUser = gSignIn.currentUser;
    DocumentSnapshot documentSnapshot = await usersReference.document(gCurrentUser.id).get();
    if(!documentSnapshot.exists){
      final username = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));
      usersReference.document(gCurrentUser.id).setData({
        "id": gCurrentUser.id,
        "profile": gCurrentUser.displayName,
        "username": username,
        "url": gCurrentUser.photoUrl,
        "email": gCurrentUser.email,
        "bio" : "",
        "timestamp": timestamp,
      });
      documentSnapshot = await usersReference.document(gCurrentUser.id).get();
      currentUser = User.fromDocument(documentSnapshot);
    }
  }
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  whenPageChanges(int pageIndex){
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }
  onTapChangePage(int pageIndex){
    pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 400), curve: Curves.bounceInOut);
  }
  Scaffold buildHomeScreen(){
    return Scaffold(
      body: PageView(
        children: <Widget>[
          TimeLinePage(),
          SearchPage(),
          UploadPage(),
          ProfilePage(),
        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: getPageIndex,
        onTap: onTapChangePage,
        backgroundColor: Theme.of(context).accentColor,
        activeColor: Colors.white,
        inactiveColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
  Scaffold buildSignedInScreen(){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor]
          )
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign in",
              style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: "Signatra"),
            ),
            GestureDetector(
              onTap: ()=> loginUser(),
              child: Container(
                width: 270.0,
                height: 65.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/google_signin_button.png"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    if(true){
      return buildHomeScreen();
    }
    return buildSignedInScreen();
  }
}
