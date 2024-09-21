import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyTextToClipboard(
  BuildContext context,
  String copiedText
) {
  Clipboard.setData(ClipboardData(text: copiedText));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 260,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, color: Colors.white),
          SizedBox(width: 10),
          Text(
            'Prompt copied to clipboard',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
      backgroundColor: Colors.teal.shade700,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
