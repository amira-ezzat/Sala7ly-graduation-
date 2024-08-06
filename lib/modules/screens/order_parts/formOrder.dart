import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sala7ly/shared/componants/textFormField.dart';

class FormOrder extends StatefulWidget {
  @override
  State<FormOrder> createState() => _FormOrderState();
}

class _FormOrderState extends State<FormOrder> {
  var numberController = TextEditingController();

  var addressController = TextEditingController();

  var quanController = TextEditingController();

  var typeController = TextEditingController();

  bool isCashSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use mainAxisSize.min to prevent infinite height
          children: [
            SizedBox(height: 20),
            defaultTextFormField(
              controller: addressController,
              type: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Address'.tr();
                }
                return null;
              },
              label: 'Your Address'.tr(),
              prefix: Icons.home_work_outlined,
            ),
            SizedBox(height: 20),
            defaultTextFormField(
              controller: numberController,
              type: TextInputType.number,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Phone Number'.tr();
                }
                return null;
              },
              label: 'Phone Number'.tr(),
              prefix: Icons.phone,
            ),
            SizedBox(height: 20),
            Align(

              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isCashSelected = !isCashSelected;
                  });
                },
                child: Container(
                  width: 376,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width: 22,
                      // ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCashSelected = true;
                          });
                        },
                        icon: Icon(
                          isCashSelected
                              ? Icons.circle_rounded
                              : Icons.circle_outlined,
                          color: isCashSelected ? Color(0xFFF0630B): Colors.grey[600] ,
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
                      SizedBox(width: 55),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCashSelected = false;
                          });
                        },
                        icon: Icon(
                          isCashSelected
                              ? Icons.circle_outlined
                              : Icons.circle_rounded,
                          color: isCashSelected ? Colors.grey[600] : Color(0xFFF0630B),
                        ),
                      ),
                      Text(
                        'Credit'.tr(),
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
            ),
            SizedBox(height: 20,),
            defaultTextFormField(
              controller: quanController,
              type: TextInputType.number,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter the Quantity'.tr();
                }
                return null;
              },
              label: 'Quantity'.tr(),
              prefix: Icons.format_list_numbered,
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
