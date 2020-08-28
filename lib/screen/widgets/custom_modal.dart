import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomModal extends StatefulWidget {
  final String message;

  CustomModal({Key key, this.message}) : super(key: key);

  @override
  _CustomModalState createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      title: Text('Oppps!'),
      content: Container(
        height: 120,
        child: Stack(
          children: <Widget>[
            Text(widget.message),
            Positioned(
              bottom: 12,
              right: 12,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK')),
            )
          ],
        ),
      ),
    );
  }
}
