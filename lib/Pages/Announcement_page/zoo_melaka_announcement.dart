import 'package:flutter/material.dart';
import 'package:ztour_mobile/Donationbyzoo/databasedonationbyzoo.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';
import 'package:ztour_mobile/Pages/Announcement_page/announcement.dart';
import 'package:ztour_mobile/Pages/Announcement_page/newspaper.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/formdatabase.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';

class NewsMelaka extends StatefulWidget {
  @override
  _NewsMelakaState createState() => _NewsMelakaState();
}

class _NewsMelakaState extends State<NewsMelaka> {
  Map<String, int> registrationnumber = {};
  int initnum = 0;

  void updateregistrationnumber() async {
    await getAllRegistration().then(
      (numbers) {
        if (mounted)
          setState(
            () {
              this.registrationnumber = numbers;
            },
          );
        else
          setState(() {
            this.registrationnumber = (initnum) as Map<String, int>;
          });
      },
    );
    setState(
      () {
        build(context);
      },
    );
  }

  Widget _body = donationLOADING();

  Map<String, String> donationnumber = {};

  void updatedonationnumber() async {
    await getAllDonationbyzoo().then(
      (numbers) {
        if (mounted)
          setState(
            () {
              this.donationnumber = numbers;
            },
          );
      },
    );
    setState(
      () {
        _body = buildNewsM(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateregistrationnumber();
    updatedonationnumber();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  @override
  Widget buildNewsM(BuildContext context) {
    final Color bgColor = Color(0xffF3F3F3);
    final Color primaryColor = Color(0xffE70F0B);

    var titleTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    var teamNameTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade800,
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.home),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnimatedBottomBar(),
                )),
          ),
        ],
        title: Text(
          "Feed",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ToggleButtons(
              fillColor: primaryColor,
              hoverColor: primaryColor,
              renderBorder: true,
              borderColor: Colors.grey.shade300,
              color: Colors.grey.shade800,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.solidNewspaper),
                      const SizedBox(height: 16.0),
                      Text(
                        "Zoo\nNegara",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.newspaper),
                      const SizedBox(height: 16.0),
                      Text("Zoo\nMelaka"),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.newspaper),
                      const SizedBox(height: 16.0),
                      Text("Zoo\nTaiping"),
                    ],
                  ),
                ),
              ],
              isSelected: [
                false,
                true,
                false,
              ],
              onPressed: (index) => {
                    if (index == 2)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsTaiping(),
                          )),
                    if (index == 0)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => News(),
                          )),
                  }),
          const SizedBox(height: 16.0),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sponsor",
                        style: teamNameTextStyle,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "RM ${donationnumber['Zoo Melaka']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      "|",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Volunteer",
                        style: teamNameTextStyle,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "${registrationnumber['Zoo Melaka']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: NetworkImage(zooM[0]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://themalaysianreserve.com/wp-content/uploads/2020/09/Zoo-Melaka-Bernama.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Dinosaur World, produk baharu Zoo Melaka",
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "NOR FARHANA | 16 September 2020",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Divider(),
          const SizedBox(height: 10.0),
          ListTile(
            title: Text(
              "After Zoo Negara, Now Zoo Melaka Needs Funds To Keep The Animals Alive",
              style: titleTextStyle,
            ),
            subtitle: Text(" Friday,10 AprilL 2020  | Iylia Adreena"),
            trailing: Container(
              width: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://d3avoj45mekucs.cloudfront.net/rojakdaily/media/iylia/news/zoomelaka.jpg?ext=.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          ListTile(
            title: Text(
              "Zoo Melaka dan Zoo Negara jalin kerjasama",
              style: titleTextStyle,
            ),
            subtitle: Text("Monday,20 March 2020, 7:02 PM | Bernama"),
            trailing: Container(
              width: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://assets.hmetro.com.my/images/articles/Zoo_Negara2_1598962979.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
