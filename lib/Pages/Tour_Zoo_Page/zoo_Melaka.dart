import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/zooM_album.dart';

import 'WebsiteView.dart';

class DetailsPageM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height * 0.9;
    double boxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Zoo Melaka"),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.red[300],
                            textColor: Colors.white,
                            child: Text(
                              "Google Earth",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                            onPressed: () => launch(
                                'https://earth.google.com/earth/rpc/cc/drive?state=%7B%22ids%22%3A%5B%221ZNLWFZV1e_ofsY-bem0JEodFGd5u3fqu%22%5D%2C%22action%22%3A%22open%22%2C%22userId%22%3A%22103372052462390541200%22%7D&usp=sharing')),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          child: Text(
                            "Experience VR Mode",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebsiteView(
                                  'VR',
                                  'Zoo Melaka',
                                  postUrl:
                                      'https://poly.google.com/view/0sR3viP7Fca',
                                ),
                              ),
                            );
                          },
                        ),
                        // => launch(
                        //     'https://poly.google.com/view/0sR3viP7Fca')),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.red[600],
                          textColor: Colors.white,
                          child: Text(
                            "Zoo Album",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => GalleryPageThree(),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.red[900],
                          textColor: Colors.white,
                          child: Text(
                            "Official Website",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebsiteView(
                                  'Website',
                                  'Zoo Melaka',
                                  postUrl:
                                      'http://www.zoomelaka.gov.my/index.html',
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // => launch(
                      //     'http://www.zoomelaka.gov.my/index.html')),
                      // ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                      width: boxWidth,
                      height: boxHeight,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: boxWidth,
                            height: boxHeight * (1 / 3),
                            padding: EdgeInsets.all(10),
                            child: Carousel(
                              images: [
                                Image.asset('assets/Zoo/Melaka/1.jpg'),
                                Image.asset('assets/Zoo/Melaka/2.jpg'),
                                Image.asset('assets/Zoo/Melaka/3.jpg')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Information",
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.black38,
                                          ),
                                          Container(
                                              child: Column(
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.person),
                                                title: Text("Name"),
                                                subtitle: Text(
                                                    "Zoo Melaka & Night Safari"),
                                              ),
                                              ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                leading:
                                                    Icon(Icons.my_location),
                                                title: Text("Location"),
                                                subtitle: Text(
                                                    "Zoo Melaka, Lebuh Ayer Keroh, Hang Tuah Jaya, 75450 Ayer Keroh, Melaka"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.email),
                                                title: Text("Email"),
                                                subtitle:
                                                    Text("info@melakazoo.com"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.phone),
                                                title: Text("Phone"),
                                                subtitle: Text("+06-2323-900"),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
