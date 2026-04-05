// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  // สร้างตัวควบคุมสำหรับ TextField เพื่อเก็บข้อมูลที่ผู้ใช้ป้อนเข้ามา
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  //สร้างตัวแปรสำหรับเก็บผลลัพธ์ของการคำนวณ BMI และข้อความแปรผล
  String bmiShowvalue = '0.00';
  String bmiShowResult = 'การแปรผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                // ส่วนชื่อหน้าจอ เเละรูป
                Text(
                  'คำนวนค่าดัชณีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 50),

                // ส่วนป้อนข้อมูล
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                  ),
                ),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกน้ำหนัก',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                  ),
                ),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกส่วนสูง',
                    border: OutlineInputBorder(),
                  ),
                ),

                //ส่วนปุ่ม
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // validate UI
                    if (weightCtrl.text.isEmpty || heightCtrl.text.isEmpty) {
                      // แสดงข้อความแจ้งเตือนเมื่อผู้ใช้ไม่ได้กรอกข้อมูลครบถ้วน
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    // คำนวนและเเสดงผล BMI
                    double weights = double.parse(weightCtrl.text);
                    double heights = double.parse(heightCtrl.text) /
                        100; // แปลงจากเซนติเมตรเป็นเมตร
                    double bmi = weights / (heights * heights);

                    setState(() {
                      bmiShowvalue = bmi.toStringAsFixed(2);
                    });

                    //แปลงผลเเละแสดงค่าแปรผล
                    bmiShowvalue = bmi.toStringAsFixed(2);
                    if (bmi < 18.5) {
                      bmiShowResult = 'ผอมเกินไป';
                    } else if (bmi < 22.9) {
                      bmiShowResult = 'สมส่วน';
                    } else if (bmi < 24.9) {
                      bmiShowResult = 'ท้วม';
                    } else if (bmi < 29.9) {
                      bmiShowResult = 'โรคอ้วนระดับที่ 1';
                    } else {
                      bmiShowResult = 'โรคอ้วนระดับที่ 2';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // ล้างข้อมูลใน TextField และผลลัพธ์
                    weightCtrl.clear();
                    heightCtrl.clear();
                    setState(() {
                      bmiShowvalue = '0.00';
                      bmiShowResult = 'การแปรผล';
                    });

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                //ส่วนเเสดงผลลัพธ์ จากการคำนวน
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMI',
                      ),
                      Text(
                        bmiShowvalue,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        bmiShowResult,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}