// import 'package:flutter/material.dart';
//
// class homestate extends StatefulWidget {
//   const homestate({super.key});
//
//   @override
//   State<homestate> createState() => _homestateState();
// }
//
// class _homestateState extends State<homestate> {
//   String dropdownvalue = '1';
//   var itemss = [
//     '1','2','3','4','5'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 300,
//           height: 150,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(10)
//           ),
//           child: Center(
//             child: DropdownButton(
//               items: itemss.map((String item){
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text(item),
//
//                 );
//               }).toList(),
//               onChanged: (String? newvalue){
//                 setState(() {
//                   dropdownvalue = newvalue!;
//                 });
//
//               },
//               value: dropdownvalue,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';

class homestate extends StatefulWidget {
  const homestate({super.key});

  @override
  State<homestate> createState() => _homestateState();
}

class _homestateState extends State<homestate> {
  String dropdownvalue = '1';
  var itemss = [
    '1','2','3','4','5'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: DropdownButton(
              items: itemss.map((String item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),

                );
              }).toList(),
              onChanged: (String? newvalue){
                setState(() {
                  dropdownvalue = newvalue!;
                });

              },
              value: dropdownvalue,
            ),
          ),
        ),
      ),
    );
  }
}

