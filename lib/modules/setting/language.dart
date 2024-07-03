import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'cubit/cubit.dart';

class ShowDialogChangeLanguage extends StatefulWidget {
  const ShowDialogChangeLanguage({super.key});
  @override
  State<ShowDialogChangeLanguage> createState() => _ShowDialogChangeLanguageState();
}
class _ShowDialogChangeLanguageState extends State<ShowDialogChangeLanguage> {

  bool isArabiclPressed = false;
  bool isEnglishPressed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          content: Column(
            children: [
              Text(
                'Chose Language'.tr(),
                style:
                     TextStyle(
                       fontFamily: 'font2',
                        fontWeight: FontWeight.bold,
                         fontSize: 20,
                       color:  Color(0xFFF0630B),
                     ),
              ),
               SizedBox(
                height: 5,
              ),
               Divider(
                thickness: 1,
              ),
               SizedBox(
                height: 5,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    // Add a variable to track whether the button is pressed
                    isArabiclPressed = true;
                  });
                  SettingsCubit.get(context).changeLanguageToArabic(context);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      // Change the background color based on the button state
                      return isArabiclPressed ?  Color(0xFFF0630B) : Colors.transparent;
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Color(0xFFF0630B),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  'Arabic'.tr(),
                  style: TextStyle(
                    color: isArabiclPressed ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    // Add a variable to track whether the button is pressed
                    isEnglishPressed = true;
                  });
                  SettingsCubit.get(context).changeLanguageToEnglish(context);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      // Change the background color based on the button state
                      return isEnglishPressed ?  Color(0xFFF0630B) : Colors.transparent;
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Color(0xFFF0630B),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  'English'.tr(),
                  style: TextStyle(
                    color: isEnglishPressed ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
