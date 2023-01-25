import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../View_mdal/department_list_vm.dart';
import '../View_mdal/pendancy_report_vm.dart';



class PendancyReport extends StatefulWidget {
  const PendancyReport({Key? key}) : super(key: key);

  @override
  State<PendancyReport> createState() => _PendancyReportState();
}
DateTime? startDate;
DateTime? endDate;
String? selectedDepartment;
class _PendancyReportState extends State<PendancyReport> {
  TextEditingController dateInput = TextEditingController();
  final reportDepartmentViewModal = Get.put(DepartmentListVM());
  final pendancyReportVM = Get.put(PendancyReportVM());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedDepartment = null;
      startDate = null;
      endDate = null;

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
                        "Pendancy Reports",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.26,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.26,
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
                                        padding: EdgeInsets.only(top: 12),
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xFFD6D6D6),
                                          radius: 13,
                                          foregroundImage: AssetImage('assets/excel.png'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 12.0,right: 12,left: 8),
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
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SizedBox(
                                      height: 50,
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
                                        onChanged: (dept) {
                                          return setState(() {
                                            selectedDepartment = dept;
                                            startDate=null;
                                            endDate = null;
                                            pendancyReportVM.pendancyReportList.clear();
                                            pendancyReportVM.isLoading.value = true;
                                            pendancyReportVM.pendancyDetails(selectedDepartment!,"1","","",);
                                          });
                                        },
                                        menuMaxHeight: 300,
                                      ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
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
                                                  pendancyReportVM.pendancyReportList.clear();
                                                  pendancyReportVM.isLoading.value = true;
                                                  pendancyReportVM.pendancyDetails("0","1",DateFormat("dd/MM/yy").format(startDate!),DateFormat("dd/MM/yy").format(endDate!));
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
                                    child: Obx(()=>(pendancyReportVM.isLoading.value == true)?Text("")
                                        : SizedBox(
                                      height: MediaQuery.of(context).size.height/2.1,
                                      width:  MediaQuery.of(context).size.width*2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: DataTable2(
                                            headingRowColor: MaterialStateColor.resolveWith((states) {return Colors.grey.shade300;},),
                                            columnSpacing: 0,
                                            horizontalMargin: 0,
                                            dataRowHeight: 60,
                                            minWidth: 50,
                                            headingRowHeight: 62,
                                            columns:  [
                                              const DataColumn2(
                                                label: Center(child: Text('\nSr.\nNo',style: TextStyle(fontSize: 11),)),
                                                size: ColumnSize.S,
                                              ),
                                              const DataColumn(
                                                label: Center(child: Text('\nDepartment\nName',style: TextStyle(fontSize: 11),)),
                                              ),
                                              const DataColumn(
                                                label: Center(child: Text('Recieved',style: TextStyle(fontSize: 11),)),
                                              ),
                                              const DataColumn(
                                                label: Center(child: Text('Pending',style: TextStyle(fontSize: 11),)),
                                              ),
                                              DataColumn(
                                                label: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const SizedBox(height: 6),
                                                      const Text('\nAction Taken    ',style: TextStyle(fontSize: 12),),
                                                      Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(bottom: 2.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: const [
                                                              Text("\n<7  ",style: TextStyle(fontSize: 10),),
                                                              Text("\n8-15   ",style: TextStyle(fontSize: 10),),
                                                              Text("\n16-30  ",style: TextStyle(fontSize: 10),),
                                                              Text("\n>30",style: TextStyle(fontSize: 10),),
                                                            ],),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                            ],
                                            rows: List<DataRow>.generate(
                                                pendancyReportVM.pendancyReportList.length,
                                                    (index) => DataRow(cells: [
                                                  DataCell(Center(child: Text("${index+1}",style: const TextStyle(fontSize: 10),))),
                                                   DataCell(Center(child: Text( pendancyReportVM.pendancyReportList[index].departmentname.toString(),style: TextStyle(fontSize: 10),))),
                                                 DataCell(Center(child: Text( pendancyReportVM.pendancyReportList[index].received.toString(),style: TextStyle(fontSize: 10),))),
                                                DataCell(Center(child: Text( pendancyReportVM.pendancyReportList[index].pending.toString(),style: TextStyle(fontSize: 10),))),
                                                  DataCell(Center(child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children:  [
                                                      Text(pendancyReportVM.pendancyReportList[index].approvedless7.toString(),style: TextStyle(fontSize:11),),
                                                      Text(pendancyReportVM.pendancyReportList[index].approvedless15.toString(),style: TextStyle(fontSize: 9.5),),
                                                      Text(pendancyReportVM.pendancyReportList[index].approvedless30.toString(),style: TextStyle(fontSize: 9.5),),
                                                      Text(pendancyReportVM.pendancyReportList[index].approvedgrt30.toString(),style: TextStyle(fontSize: 9.5),),
                                                    ],
                                                  ))),
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
