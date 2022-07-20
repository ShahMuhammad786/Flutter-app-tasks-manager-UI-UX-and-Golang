import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/colors/app_colors.dart';
import 'package:flutter_golang_yt/widgets/button_widgets.dart';
import 'package:flutter_golang_yt/widgets/textField_widget.dart';
import 'package:get/get.dart';
import '../colors/app_colors.dart';
// import 'package:/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddTask();
  }
}

class _AddTask extends State<AddTask> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailsController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/addtask1.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    ))
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    icon: const Icon(Icons.edit_note),
                    textController: nameController,
                    hintText: "Add name",
                    borderRadius: 10),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: AppColors.textHolder,
                      hintText: "Pick a date",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1))),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String str = pickedDate.toString();
                      var arr = str.split(' ');
                      print(arr[0]);
                      setState(() {
                        dateinput.text = arr[0];
                        //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  icon: const Icon(Icons.note_add),
                  textController: detailsController,
                  hintText: "Add details",
                  borderRadius: 10,
                  maxLines: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    text: "ADD",
                    textColor: Colors.white)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            )
          ],
        ),
      ),
    );
  }
}
