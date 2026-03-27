// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  int selectedSex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                // ส่วนข้อความ คำนวณหาอัตราการเผาผลาญ
                Text(
                  'คำนวณหาอัตราการเผาผลาญ',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  'ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                // ส่วนรูปภาพ
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/bmr.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // ส่วนของปุ่มเลือกเพศ
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedSex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'ชาย',
                            style: TextStyle(
                              color:
                                  selectedSex == 1 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedSex == 1 ? Colors.blue : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedSex = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'หญิง',
                            style: TextStyle(
                              color: selectedSex == 2
                                    ? Colors.white
                                    : Colors.black,
                              ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedSex == 2 ? Colors.blue : Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // ส่วนของที่กรอกข้อมูล
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
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
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกส่วนสูง',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกอายุของคุณ',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                // ส่วนปุ่ม คำนวณ---
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // ส่วนแสดงผล
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
                        '0.00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'kcal/day',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}