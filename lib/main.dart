import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  skillType skilltype = skillType.photoShop;
  void updateselectedskill(skillType type) {
    setState(() {
      this.skilltype = type;
    });
  }

  Locale locale = Locale('en');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        //brightness: Brightness.dark,
        // scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyText2: TextStyle(fontSize: 16),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: pagefa(
        selectedLanguageChanged: (_Language newSelectedLanguageByUser) {
          setState(() {
            locale = newSelectedLanguageByUser == _Language.en
                ? Locale('en')
                : Locale('fa');
          });
        },
      ),
    );
  }
}

//////
///////
//////
//////
/////
/////
//

class pagefa extends StatefulWidget {
  final Function(_Language _language) selectedLanguageChanged;
  pagefa({Key? key, required this.selectedLanguageChanged}) : super(key: key);
  @override
  State<pagefa> createState() => _pagefa();
}

Color textcolor = Color.fromARGB(255, 248, 246, 240);
Color backcolor = Color.fromARGB(255, 30, 30, 30);

enum skillType {
  photoShop,
  lightRoom,
  afterEffect,
  illustrator,
  adobeXd,
}

enum _Language {
  en,
  fa,
}

class _pagefa extends State<pagefa> {
  skillType skilltype = skillType.photoShop;
  _Language _language = _Language.en;
  void updateselectedskill(skillType type) {
    setState(() {
      this.skilltype = type;
    });
  }

  void updateselectedlanguage(_Language language) {
    widget.selectedLanguageChanged(language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: backcolor,
      appBar: AppBar(
        title: Text(localization.profiletitle),
        actions: [
          Icon(Icons.chat_bubble_outline_rounded),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              setState(() {
                if (textcolor == Colors.black) {
                  textcolor = backcolor = Color.fromARGB(255, 248, 246, 240);
                  backcolor = Color.fromARGB(255, 30, 30, 30);
                } else if (textcolor == Color.fromARGB(255, 248, 246, 240)) {
                  textcolor = Color.fromARGB(255, 0, 0, 0);
                  backcolor = Color.fromARGB(255, 248, 246, 240);
                  ;
                }
              });
            },
            icon: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 0, 0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("images/profile.png",
                          height: 60, width: 60),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localization.name,
                            style: TextStyle(
                              fontSize: 13,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            localization.job,
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          SizedBox(height: 3),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: textcolor,
                              ),
                              Text(
                                localization.location,
                                style:
                                    TextStyle(fontSize: 13, color: textcolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(CupertinoIcons.heart, color: Colors.pink.shade500),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 8, 0),
                child: Text(
                  localization.summary,
                  style: TextStyle(
                    color: textcolor,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(thickness: 3.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                    child: Text(
                      localization.selectedlanguage,
                      style: TextStyle(
                        color: textcolor,
                      ),
                    ),
                  ),
                  CupertinoSlidingSegmentedControl<_Language>(
                      groupValue: _language,
                      thumbColor: Colors.grey,
                      children: {
                        _Language.en: Text(localization.enlanguage,
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        _Language.fa: Text(
                          localization.falanguage,
                          style: TextStyle(fontSize: 14),
                        ),
                      },
                      onValueChanged: (value) {
                        if (value != null) updateselectedlanguage(value);
                      }),
                  SizedBox(
                    width: 0,
                  ),
                ],
              ),
              Divider(thickness: 3.5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 7, 0),
                    child: Text(
                      localization.skills,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: textcolor),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 10,
                    color: textcolor,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  direction: Axis.horizontal,
                  children: [
                    skill(
                      ontap: () {
                        updateselectedskill(skillType.photoShop);
                      },
                      type: skillType.photoShop,
                      title: "Photoshop",
                      imagepath: "images/app1.png",
                      shadowcolor: Colors.blueAccent,
                      isactive: skilltype == skillType.photoShop,
                    ),
                    skill(
                      ontap: () {
                        updateselectedskill(skillType.lightRoom);
                      },
                      type: skillType.lightRoom,
                      title: "Lightroom",
                      imagepath: "images/app2.png",
                      shadowcolor: Colors.lightBlueAccent,
                      isactive: skilltype == skillType.lightRoom,
                    ),
                    skill(
                      ontap: () {
                        updateselectedskill(skillType.afterEffect);
                      },
                      type: skillType.afterEffect,
                      title: "After Effect",
                      imagepath: "images/app3.png",
                      shadowcolor: Colors.blue,
                      isactive: skilltype == skillType.afterEffect,
                    ),
                    skill(
                      ontap: () {
                        updateselectedskill(skillType.illustrator);
                      },
                      type: skillType.illustrator,
                      title: "Illustrator",
                      imagepath: "images/app4.png",
                      shadowcolor: Colors.orangeAccent,
                      isactive: skilltype == skillType.illustrator,
                    ),
                    skill(
                      ontap: () {
                        updateselectedskill(skillType.adobeXd);
                      },
                      type: skillType.adobeXd,
                      title: "Adobe Xd",
                      imagepath: "images/app5.png",
                      shadowcolor: Colors.pinkAccent,
                      isactive: skilltype == skillType.adobeXd,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 3.5),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: Text(
                  localization.information,
                  style: TextStyle(color: textcolor),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        label: Text(
                          localization.email,
                          style: TextStyle(color: textcolor),
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.at,
                          color: textcolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        label: Text(
                          localization.password,
                          style: TextStyle(color: textcolor),
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: textcolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink.shade400),
                        onPressed: () {},
                        child: Text(
                          localization.save,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class skill extends StatelessWidget {
  final skillType type;
  final Function() ontap;
  final String title;
  final String imagepath;
  final Color shadowcolor;
  final bool isactive;
  const skill({
    super.key,
    required this.ontap,
    required this.type,
    required this.title,
    required this.imagepath,
    required this.shadowcolor,
    required this.isactive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: ontap,
      child: Container(
        width: 90,
        height: 90,
        decoration: isactive
            ? BoxDecoration(
                color: Color.fromARGB(30, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: isactive
                    ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowcolor.withOpacity(0.7),
                            blurRadius: 11,
                          ),
                        ],
                      )
                    : null,
                child: Image.asset(imagepath, width: 50, height: 50)),
            SizedBox(height: 2.5),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
