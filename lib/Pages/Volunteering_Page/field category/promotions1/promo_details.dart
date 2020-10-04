import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/home.dart';
// import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/search.dart';
import '../../Registrationform/formregistration.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/Registrationform/formregistration.dart';

class PromoDetails extends StatelessWidget {
  PromoDetails(this.promodetails);
  final String promodetails;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'PROMOTIONS',
        style: textTheme.subtitle1.copyWith(fontSize: 18.0),
      ),
      SizedBox(height: 20.0),
      Text(
        promodetails,
        style: textTheme.bodyText2.copyWith(
          color: Colors.black45,
          fontSize: 16.0,
        ),
      ),
      Container(
        height: 150,
        padding: EdgeInsets.only(top: 30, left: 5, right: 2),
        child: Card(
          elevation: 5.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegistrationForm(),
                          )),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_forward_ios),
                          Text("  Click Here to Join Us!‎",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    /* IconButton(
                              icon: Icon(Icons.star_border),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => VolunteerForm())),
                            )*/
                  ],
                ),
                Container(
                    //  height: 80,
                    padding: EdgeInsets.fromLTRB(10.0, 0, 20.0, 16.0),
                    child: Text(
                      "\nA good chance to give back to society is \nby volunteering.",
                      textAlign: TextAlign.justify,
                    ))
              ],
            ),
          ),
        ),
      )
    ]);

    // ]);
  }
}
