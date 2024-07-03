import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class PinCodeDemo extends StatefulWidget {
  @override
  _PinCodeDemoState createState() => _PinCodeDemoState();
}

class _PinCodeDemoState extends State<PinCodeDemo> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PIN Code Fields Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter PIN Code:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              textStyle: TextStyle(
                color: Colors.white
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 70,
                fieldWidth: 70,
                activeFillColor: Color(0xFFF0630B),
                inactiveFillColor:Color(0xFFF0630B),
                selectedFillColor: Color(0xFFF0630B),
                activeColor: Color(0xFFF0630B),
                inactiveColor: Color(0xFFF0630B),
                selectedColor:Color(0xFFF0630B),
              ),
              cursorColor: Colors.white, // لون المؤشر
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: pinController,
              onCompleted: (v) {
                print("Completed: $v");
              },
              onChanged: (value) {
                print(value);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
// class SpeechToTextExample extends StatefulWidget {
//   @override
//   _SpeechToTextExampleState createState() => _SpeechToTextExampleState();
// }
//
// class _SpeechToTextExampleState extends State<SpeechToTextExample> {
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = ''; // نص الكلام المكتوب
//   String _currentText = ''; // النص الحالي الذي يتم كتابته
//
//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }
//
//   void _toggleListening() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => _onSpeechStatus(val),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() {
//           _isListening = true;
//           _currentText = _text; // حفظ النص الحالي للكتابة فوقه
//         });
//         _speech.listen(
//           onResult: (val) {
//             setState(() {
//               _text = _currentText + '\n' + (val.recognizedWords ?? ''); // إضافة الكلمات المعرفة إلى النص الحالي مع سطر جديد
//             });
//           },
//           localeId: "ar_SA", // تعيين اللغة العربية كلغة التعرف
//           partialResults: true, // تمكين النتائج الجزئية
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
//
//   void _onSpeechStatus(String status) {
//     if (status == 'done' && _isListening) {
//       setState(() => _isListening = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Speech to Text Example')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   _text,
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             FloatingActionButton(
//               onPressed: _toggleListening,
//               child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Widget _buildDateField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Date'.tr(),
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       SizedBox(height: 8.0),
//       TextFormField(
//         controller: dateController,
//         keyboardType: TextInputType.datetime,
//         decoration: InputDecoration(
//           hintText: 'Specify date of order..'.tr(),
//           hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
//         ),
//         onTap: () async {
//           DateTime? pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime.now(),
//             lastDate: DateTime(2100),
//           );
//           if (pickedDate != null) {
//             dateController.text = DateFormat.yMMMd().format(pickedDate);
//           }
//         },
//       ),
//     ],
//   );
// }
//
// // Helper method to build Time TextFormField
// Widget _buildTimeField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Time'.tr(),
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       SizedBox(height: 8.0),
//       TextFormField(
//         controller: timeController,
//         keyboardType: TextInputType.datetime,
//         decoration: InputDecoration(
//           hintText: 'Specify time of order..'.tr(),
//           hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           prefixIcon: Icon(Icons.access_time, color: Colors.grey),
//         ),
//         onTap: () async {
//           TimeOfDay? pickedTime = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.now(),
//           );
//           if (pickedTime != null) {
//             timeController.text = pickedTime.format(context);
//           }
//         },
//       ),
//     ],
//   );
// }
//
// // Helper method to build Problem TextFormField
//
//
// // Helper method to build Type Request Section
// Widget _buildTypeRequest() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Type Request'.tr(),
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       SizedBox(height: 8.0),
//       GestureDetector(
//         onTap: () {
//           setState(() {
//             isTypeSelected = !isTypeSelected;
//           });
//         },
//         child: Container(
//           width: double.infinity,
//           height: 66,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey.shade400,
//               width: 2.0,
//             ),
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: Row(
//             children: [
//               SizedBox(width: 22),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isTypeSelected = true;
//                   });
//                 },
//                 icon: Icon(
//                   isTypeSelected ? Icons.check_box : Icons.check_box_outline_blank,
//                   color: isTypeSelected ? Color(0xFFF0630B) : Colors.grey[600],
//                 ),
//               ),
//               Text(
//                 'Normal'.tr(),
//                 style: TextStyle(
//                   fontFamily: 'font2',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[600],
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(width: 55),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isTypeSelected = false;
//                   });
//                 },
//                 icon: Icon(
//                   isTypeSelected ? Icons.check_box_outline_blank : Icons.check_box,
//                   color: isTypeSelected ? Colors.grey[600] : Color(0xFFF0630B),
//                 ),
//               ),
//               Text(
//                 'Emergency'.tr(),
//                 style: TextStyle(
//                   fontFamily: 'font2',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[600],
//                   fontSize: 16.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// // Helper method to build Paying Off Section
// Widget _buildPayingOff() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Paying Off'.tr(),
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       SizedBox(height: 8.0),
//       GestureDetector(
//         onTap: () {
//           setState(() {
//             isCashSelected = !isCashSelected;
//           });
//         },
//         child: Container(
//           width: double.infinity,
//           height: 66,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey.shade400,
//               width: 2.0,
//             ),
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: Row(
//             children: [
//               SizedBox(width: 22),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isCashSelected = true;
//                   });
//                 },
//                 icon: Icon(
//                   isCashSelected ? Icons.circle_rounded : Icons.circle_outlined,
//                   color: isCashSelected ? Color(0xFFF0630B) : Colors.grey[600],
//                 ),
//               ),
//               Text(
//                 'Cash'.tr(),
//                 style: TextStyle(
//                   fontFamily: 'font2',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[600],
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(width: 66),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isCashSelected = false;
//                   });
//                 },
//                 icon: Icon(
//                   isCashSelected ? Icons.circle_outlined : Icons.circle_rounded,
//                   color: isCashSelected ? Colors.grey[600] : Color(0xFFF0630B),
//                 ),
//               ),
//               Text(
//                 'Wallet'.tr(),
//                 style: TextStyle(
//                   fontFamily: 'font2',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[600],
//                   fontSize: 16.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// // Helper method to build Send Button
// Widget _buildSendButton() {
//   return Container(
//     decoration: BoxDecoration(
//       color: Color(0xFFF0630B),
//       borderRadius: BorderRadius.circular(10.0),
//     ),
//     width: double.infinity,
//     child: TextButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Confirmation'),
//             content: Text('Do you want to send the request?'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Implement your send request logic here
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Send'),
//               ),
//             ],
//           ),
//         );
//       },
//       child: Text(
//         'Send'.tr(),
//         style: TextStyle(
//           fontSize: 20.0,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }