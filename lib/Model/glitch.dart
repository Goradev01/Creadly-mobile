class Glitch {
  String message;
  Glitch({
    required this.message,
  });

  @override
  String toString() => 'Glitch(message: $message)';
}
//  var snackBar = SnackBar(
//                                       backgroundColor: Colors.white,
//                                       content: Text(
//                                         'Copied!',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             fontSize: 14.0,
//                                             fontWeight: FontWeight.w500,
//                                             color: design.ash),
//                                       ),
//                                     );
//                                     Clipboard.setData(const ClipboardData(
//                                         text: "Credley/kanyetgev"));
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(snackBar);