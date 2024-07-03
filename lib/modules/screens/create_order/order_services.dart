import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sala7ly/modules/screens/confirm.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrdServicess extends StatefulWidget {
  @override
  State<OrdServicess> createState() => _OrdServicesState();
}

class _OrdServicesState extends State<OrdServicess> {
  var nomberController = TextEditingController();
  var problemController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var addressController = TextEditingController();
  bool isArabiclPressed = false;
  bool isEnglishPressed = false;
  bool isCashSelected = true;
  bool isTypeSelected = true;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _toggleListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => _onSpeechStatus(val),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
          _textController.text = problemController.text;
        });
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = _textController.text + '\n' + (val.recognizedWords ?? '');
              problemController.text = _text;
            });
          },
          localeId: "ar_SA",
          partialResults: true,
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _onSpeechStatus(String status) {
    if (status == 'done' && _isListening) {
      setState(() => _isListening = false);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request Order'.tr(),
          style: TextStyle(
            color: Color(0xFFF0630B),
            fontSize: 25,
            fontFamily: 'font1',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Phone Number'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: nomberController,
                cursorColor: Colors.grey.shade500,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number'.tr(),
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Address'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: addressController,
                cursorColor: Colors.grey.shade500,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter your address'.tr(),
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Date'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: 'Specify date of order..'.tr(),
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    dateController.text = DateFormat.yMMMd().format(pickedDate);
                  }
                },
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Time'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.datetime,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    if (value != null) {
                      timeController.text = value.format(context).toString();
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Specify time of order..'.tr(),
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(Icons.watch_later_outlined, color: Colors.grey),
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Problem'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextFormField(
                controller: problemController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.grey.shade500,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Write your problem or.....'.tr(),
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: _toggleListening,
                    icon: Icon(
                      _isListening ? Icons.mic : Icons.mic_none,
                      color: _isListening ? Color(0xFFF0630B) : Colors.grey[500],
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Type Request'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTypeSelected = !isTypeSelected;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 22),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isTypeSelected = true;
                          });
                        },
                        icon: Icon(
                          isTypeSelected ? Icons.check_box : Icons.check_box_outline_blank,
                          color: isTypeSelected ? Color(0xFFF0630B) : Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Normal'.tr(),
                        style: TextStyle(
                          fontFamily: 'font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 55),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isTypeSelected = false;
                          });
                        },
                        icon: Icon(
                          isTypeSelected ? Icons.check_box_outline_blank : Icons.check_box,
                          color: isTypeSelected ? Colors.grey[600] : Color(0xFFF0630B),
                        ),
                      ),
                      Text(
                        'Emergency'.tr(),
                        style: TextStyle(
                          fontFamily: 'font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  '  Paying Off'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCashSelected = !isCashSelected;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 22),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCashSelected = true;
                          });
                        },
                        icon: Icon(
                          isCashSelected ? Icons.circle_rounded : Icons.circle_outlined,
                          color: isCashSelected ? Color(0xFFF0630B) : Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Cash'.tr(),
                        style: TextStyle(
                          fontFamily: 'font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 66),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCashSelected = false;
                          });
                        },
                        icon: Icon(
                          isCashSelected ? Icons.circle_outlined : Icons.circle_rounded,
                          color: isCashSelected ? Colors.grey[600] : Color(0xFFF0630B),
                        ),
                      ),
                      Text(
                        'Wallet'.tr(),
                        style: TextStyle(
                          fontFamily: 'font2',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF0630B),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Confirm(
                        phoneNumber: nomberController.text,
                        address: addressController.text,
                        date: dateController.text,
                        time: timeController.text,
                        problem: problemController.text,
                      ),
                    );
                  },
                  child: Text(
                    'Send'.tr(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}