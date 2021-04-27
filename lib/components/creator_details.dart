import 'dart:async';

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorInfo extends StatefulWidget {
  @override
  _AuthorInfoState createState() => _AuthorInfoState();
}

class _AuthorInfoState extends State<AuthorInfo> {
  final String mail = " @yeasinsheikh50";
  int _charIndex = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _charIndex += 1;
        if (_charIndex >= mail.length) _charIndex = 1;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _bodyFS = Theme.of(context).textTheme.bodyText1!.fontSize! * 1.2;
    final _textStyle = GoogleFonts.lato(
      fontSize: _bodyFS,
      letterSpacing: 1.3,
      color: Colors.black,
    );

    return Container(
      child: Row(
        children: [
          EasyRichText(
            mail,
            defaultStyle: _textStyle,
            patternList: [
              EasyRichTextPattern(
                targetString: mail[_charIndex],
                matchWordBoundaries: false,
                hasSpecialCharacters: true,
                stringBeforeTarget: mail[_charIndex - 1],
                style: _textStyle.copyWith(
                  fontSize: _bodyFS * 1.1,
                  color: Color.fromRGBO(97, 70, 244, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
