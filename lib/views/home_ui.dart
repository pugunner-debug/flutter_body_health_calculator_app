// ignore_for_file: sort_child_properties_last
 
import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/about_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmr_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  // สร้างตัวแปรเก็บหมายเลข idex เพื่อเอาไปใช้กับ barItem
  int selectedIndex = 1;

  // สร้างตัวแปรเก็บหน้าจอย่อยเอามาใช้กับ body
  List supPage =[
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ส่วนของ  AppBar ---
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'BHCC App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar---
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'เกี่ยวกับ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_run_outlined,
            ),
            label: 'BMR',
          ),
        ],
      ),
      // ส่วนของ Body -----
      body: supPage[selectedIndex],
    );
  }
}