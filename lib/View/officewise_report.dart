import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../View_mdal/department_list_vm.dart';
import '../View_mdal/get_office_viewmodal.dart';
import '../View_mdal/officewise_report_vm.dart';



class OfficeWiseReport extends StatefulWidget {
  const OfficeWiseReport({Key? key}) : super(key: key);

  @override
  State<OfficeWiseReport> createState() => _OfficeWiseReportState();
}
DateTime? startDate;
DateTime? endDate;
String? selectedDepartment;
String? selectedOfficeValue;
class _OfficeWiseReportState extends State<OfficeWiseReport> {
  TextEditingController dateInput = TextEditingController();
  final reportDepartmentViewModal = Get.put(DepartmentListVM());
  final officeWiseReportVm = Get.put(OfficeWiseReportVm());
  final getOfficeByIdViewModal = Get.put(GetOfficeByIdViewModal());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedDepartment = null;
      selectedOfficeValue = null;
      startDate = null;
      endDate = null;
      getOfficeByIdViewModal.grievanceOfficeList.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 0.1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.07,
                  color: const Color(0xFFb83058),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new,size: 20),
                        color: Colors.white,
                      ),
                      const Text(
                        "Office wise Reports",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.20,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.20,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.white,
                              elevation: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFFD6D6D6),
                                          radius: 13,
                                          foregroundImage: AssetImage('assets/excel.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.0,right: 12,left: 8),
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFFD6D6D6),
                                          radius: 13,
                                          foregroundImage: AssetImage('assets/pdf.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                    EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      'Department',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                            color:
                                            Colors.grey.shade100),
                                      ),
                                      child: Obx(()=>(reportDepartmentViewModal.isLoading.value == true)?const Text("")
                                          : DropdownButtonFormField<String>(
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_outlined),
                                        decoration: InputDecoration(
                                            hintText: "Select Department",
                                            isDense: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .grey.shade400))),
                                        value: selectedDepartment,
                                        items: reportDepartmentViewModal.departmentList.map(
                                                (items) =>
                                                DropdownMenuItem<String>(
                                                  value: items.id.toString(),
                                                  child: Text(items.departmentName.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                )).toList(),
                                        onChanged: (dept) =>{
                                         setState(() {
                                            selectedDepartment = dept;
                                            startDate=null;
                                            endDate = null;
                                            officeWiseReportVm.officeReportList.clear();
                                            officeWiseReportVm.isLoading.value = true;
                                            getOfficeByIdViewModal.grievanceOfficeList.clear();
                                             selectedOfficeValue = null;
                                             getOfficeByIdViewModal.isLoading.value = true;
                                            officeWiseReportVm.officeDetails(selectedDepartment!,"0","1","","",);
                                            getOfficeByIdViewModal.getOfficeByDepartment(selectedDepartment!);



                                          }),


                                        },
                                        menuMaxHeight: 300,
                                      ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Padding(
                                    padding:
                                    EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      'Office',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 49,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                            color:
                                            Colors.grey.shade500),
                                      ),
                                      child: Obx(()=>(getOfficeByIdViewModal.isLoading.value == true)?Row(children:  const [
                                        Text(
                                            "    select Office",style: TextStyle(fontSize: 16,color: Colors
                                            .black54 ),)
                                      ])
                                          : DropdownButtonFormField<String>(
                                        icon: const Icon(Icons
                                            .keyboard_arrow_down_outlined),
                                        decoration: InputDecoration(
                                            hintText: "Select Office",
                                            isDense: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                        value: selectedOfficeValue,
                                        items: getOfficeByIdViewModal.grievanceOfficeList.map(
                                                (items) =>
                                                DropdownMenuItem<String>(
                                                  value: items.id.toString(),
                                                  child: Text(items.name.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                )).toList(),
                                        onChanged: (office) {
                                          return setState(() {
                                            selectedOfficeValue = office;
                                            startDate=null;
                                            endDate = null;
                                            officeWiseReportVm.officeReportList.clear();
                                            officeWiseReportVm.isLoading.value = true;
                                            officeWiseReportVm.officeDetails(selectedDepartment!,selectedOfficeValue!,"1","","",);




                                          });
                                        },
                                        menuMaxHeight: 300,
                                      ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Padding(
                                    padding:
                                    EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      'Date',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: TextField(
                                      cursorColor: Colors.grey,
                                      controller: dateInput,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText:(endDate == null && startDate == null)? "Select Date": "${DateFormat("dd MMM").format(startDate!)} -  ${DateFormat("dd MMM").format(endDate!)}",
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: ()async {
                                            showCustomDateRangePicker(
                                              context,
                                              dismissible: true,
                                              minimumDate: DateTime(2021, 11, 5),
                                              maximumDate: DateTime.now(),
                                              endDate: endDate,
                                              startDate: startDate,
                                              onApplyClick: (start, end) {
                                                setState(() {
                                                  endDate = end;
                                                  startDate = start;
                                                  selectedDepartment= null;
                                                  selectedOfficeValue= null;
                                                  officeWiseReportVm.officeReportList.clear();
                                                  officeWiseReportVm.isLoading.value = true;
                                                  officeWiseReportVm.officeDetails("0","0","1",DateFormat("dd/MM/yy").format(startDate!),DateFormat("dd/MM/yy").format(endDate!));
                                                });
                                              },
                                              onCancelClick: () {
                                                setState(() {
                                                  endDate = null;
                                                  startDate = null;
                                                });
                                              },

                                            );


                                          },
                                          icon: const Icon(Icons.calendar_month,
                                              color: Color(0xFFb83058),size: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Obx(()=>(officeWiseReportVm.isLoading.value == true)?const Text("")
                                        : SizedBox(
                                      height: MediaQuery.of(context).size.height/2.2,
                                      width:  MediaQuery.of(context).size.width*2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: DataTable2(
                                            headingRowColor: MaterialStateColor.resolveWith((states) {return Colors.grey.shade300;},),
                                            columnSpacing: 2,
                                            horizontalMargin: 1,
                                            dataRowHeight: 60,

                                            columns: const [
                                              DataColumn2(
                                                label: Center(child: Text('\nSr.\nNo',style: TextStyle(fontSize: 10.5),)),
                                                size: ColumnSize.M,
                                              ),
                                              DataColumn(
                                                label: Text('\nDepartment\nName',style: TextStyle(fontSize: 10.4),),
                                              ),
                                              DataColumn(
                                                label: Text('Office',style: TextStyle(fontSize: 10.4),),
                                              ),

                                              DataColumn(
                                                label: Center(child: Text('Open',style: TextStyle(fontSize: 10.5),)),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Accepted',style: TextStyle(fontSize: 10.5),)),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Resolved',style: TextStyle(fontSize: 10.5))),
                                                numeric: true,
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('\nPartial \n Resolved',style: TextStyle(fontSize: 10.5))),
                                                numeric: true,
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Transfered',style: TextStyle(fontSize: 10.5))),
                                                numeric: true,
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                                officeWiseReportVm.officeReportList.length,
                                                    (index) => DataRow(
                                                    cells: [
                                                      DataCell(Center(child: Text("${index+1}",style: const TextStyle(fontSize: 11),))),
                                                      DataCell(Text(( officeWiseReportVm.officeReportList[index].departmentname)!,style: const TextStyle(fontSize: 12),)),
                                                      DataCell(Text((  officeWiseReportVm.officeReportList[index].officeName)!,style: const TextStyle(fontSize: 12),)),
                                                      DataCell(Center(child: Text(( officeWiseReportVm.officeReportList[index].openn).toString(),style: const TextStyle(fontSize: 12),))),
                                                      DataCell(Center(child: Text(( officeWiseReportVm.officeReportList[index].accepted).toString(),style: const TextStyle(fontSize: 12),))),
                                                      DataCell(Center(child: Text(( officeWiseReportVm.officeReportList[index].resolved).toString(),style: const TextStyle(fontSize: 12),))),
                                                      DataCell(Center(child: Text(( officeWiseReportVm.officeReportList[index].partialResloved).toString(),style: const TextStyle(fontSize: 12),))),
                                                      DataCell(Center(child: Text(( officeWiseReportVm.officeReportList[index].transfered).toString(),style: const TextStyle(fontSize: 12),))),

                                                    ]))),
                                      ),
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
