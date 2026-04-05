// ignore_for_file: sort_child_properties_last
 
import 'package:flutter/material.dart';
 
class BmrUi extends StatefulWidget {
  const BmrUi({super.key});
 
  @override
  State<BmrUi> createState() => _BmrUiState();
}
 
class _BmrUiState extends State<BmrUi> {
  //สร้างตัวควบคุม TextField
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController aCtrl = TextEditingController();
 
  //ตัวแปรเก็บค่า BMR
  String showBmrValue = '0';
 
  //ตัวแปรเก็บค่าเพศที่ไม่ได้เลือก
  String gender = 'ชาย';
 
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
                //ส่วนชื่อหน้าจอ และรูป
                Text(
                  'คำนวนหาอัตราการเผาผลาญที่ร่างกายต้องการ(BMR)',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmr.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                //ส่วนปุ่มเลือกเพศ
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gender = 'ชาย';
                      });
                    },
                    child: Text(
                      'ชาย'
                      ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 70),
                      backgroundColor: gender == 'ชาย' ? Colors.blue : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gender = 'หญิง';
                      });
                    },
                    child: Text(
                      'หญิง'
                      ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150,70),
                      backgroundColor: gender == 'หญิง' ? Colors.pink : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                //ส่วนของการป้อนข้อมูล
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก(KG)',
 
                    //ส่วนของปุ่ม
 
                    //ส่วนของแสดงผล
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณาป้อนน้ำหนักของคุณ',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง(cm)',
 
                    //ส่วนของปุ่ม
 
                    //ส่วนของแสดงผล
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณาป้อนส่วนสูงของคุณ',
                    border: OutlineInputBorder(),
                  ),
                ),
                       SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ(ปี)',
 
                    //ส่วนของปุ่ม
 
                    //ส่วนของแสดงผล
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: aCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณาป้อนอายุของคุณ',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                //ส่วนของปุ่ม
                ElevatedButton(
                  onPressed: () {
                    //validate Ui
                    if(wCtrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('กรุณาป้อนน้ำหนักของคุณ')),
                      );
                      return;
                    }else if(hCtrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('กรุณาป้อนส่วนสูงของคุณ')),
                      );
                      return;
                    }else if(aCtrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('กรุณาป้อนอายุของคุณ')),
                      );
                      return;
                    }
 
                    //คำนวณ BMR และแสดงผล BMR อย่าลืมพิสูจน์เพศและแสดงผล
                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    int a = int.parse(aCtrl.text);
                    double bmr = 0;
 
                    if(gender == 'ชาย'){
                      bmr = 66 + (13.7 * w) + (5 * h) - (6.8 * a);
                    }else{
                      bmr = 655 + (9.6 * w) + (1.8 * h) - (4.7 * a);
                    }
                    setState(() {
                      showBmrValue = bmr.toStringAsFixed(2);
                    });
                  },
                  child: Text(
                    'คํานวณ BMR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //ให้ทุกอย่างกลับเป็นค่าเริ่มต้น
                    setState(() {
                      wCtrl.text = '';
                      hCtrl.text = '';
                      aCtrl.text = '';
                      showBmrValue = '0.00';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
                //ส่วนของแสดงผล
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 146, 250, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                    Text(
                      'BMR',
                      ),
                    Text(
                      showBmrValue,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
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