import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utility/common_widgets.dart';
import '../View_mdal/department_list_vm.dart';
import '../View_mdal/dept_report_vm.dart';
import '../View_mdal/get_office_viewmodal.dart';
import '../View_mdal/officewise_report_vm.dart';
import '../View_mdal/pendancy_report_vm.dart';
import '../View_mdal/statisfied_unsatisfied_vm.dart';
import '../View_mdal/taluka_report_vm.dart';
import '../View_mdal/taluka_viewmodal.dart';



class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final reportDepartmentViewModal = Get.put(DepartmentListVM());
  final deptReportVm = Get.put(DeptReportVm());
  final officeWiseReportVm = Get.put(OfficeWiseReportVm());
  final getOfficeByIdViewModal = Get.put(GetOfficeByIdViewModal());
  final talukaViewModal = Get.put(TalukaViewModal());
  final talukaReportVm = Get.put(TalukaReportVm());
  final pendancyReportVM = Get.put(PendancyReportVM());
  final satisfactionReportVM = Get.put(SatisfactionReportVM());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFb83058),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
            child: Container(
              decoration: const BoxDecoration(
                color:Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/20,
            left: MediaQuery.of(context).size.width/21,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    const Text("Reports",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                            fontFamily: 'Montserrat-Regular'))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
              top: MediaQuery.of(context).size.height /10,
            ),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.30,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        // blurStyle:BlurStyle.outer,
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: const Offset(0, 5)
                    )
                  ],
                ),
                child:Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 25),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: MediaQuery.of(context).size.width/16,
                    mainAxisSpacing: MediaQuery.of(context).size.width/9,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            deptReportVm.deptReport.clear();
                            reportDepartmentViewModal.departmentList.clear();
                            reportDepartmentViewModal.isLoading.value=false;
                            await reportDepartmentViewModal.getDepartment();
                           await deptReportVm.deptDetails("0","1","","");
                            Get.toNamed('/department');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0XffD6E4FF), imageIconText: 'Department\nwise Reports')),
                      GestureDetector(
                          onTap: () async {
                            officeWiseReportVm.officeReportList.clear();
                            reportDepartmentViewModal.departmentList.clear();
                            reportDepartmentViewModal.isLoading.value=false;
                            await reportDepartmentViewModal.getDepartment();
                            await officeWiseReportVm.officeDetails("0","0","1","","");
                            Get.toNamed('/OfficeWiseReport');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffD0F1F2),imageIconText: 'Office \nwise Reports')),
                      GestureDetector(
                          onTap: () async {
                            talukaViewModal.talukaList.clear();
                            talukaReportVm.talukaReport.clear();
                            talukaReportVm.isLoading.value=false;
                            await talukaViewModal.getAllTaluka();
                            await talukaReportVm.talukaDetails("0","1","","");
                            Get.toNamed('/TalukaWiseReport');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffEDD6FF),imageIconText: 'Taluka \nwise Reports')),
                      GestureDetector(
                          onTap: () async {
                            pendancyReportVM.pendancyReportList.clear();
                            reportDepartmentViewModal.departmentList.clear();
                            pendancyReportVM.isLoading.value=false;
                            await reportDepartmentViewModal.getDepartment();
                            await pendancyReportVM.pendancyDetails("0","1","","");
                            Get.toNamed('/PendancyReport');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffF6C1D1),imageIconText: 'Pendency\nStatus')),
                      GestureDetector(
                          onTap: () async {
                            satisfactionReportVM.satisReportList.clear();
                            reportDepartmentViewModal.departmentList.clear();
                            satisfactionReportVM.isLoading.value=false;
                            await reportDepartmentViewModal.getDepartment();
                            await satisfactionReportVM.satisfiedDetails("0","1","","");

                            Get.toNamed('/SatisfactionReport');
                          },
                          child: dashboardGridContainer(context,boxColor: Color(0xffAFE4FF),imageIconText: 'Satisfied/\nUnsatisfied\nReports')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,
                right: MediaQuery.of(context).size.width/2,
                top: MediaQuery.of(context).size.height/4.8
            ),
            child: reportsIconContainer(shadowColor: const Color(0xFFc8d5ee)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/3,
                right: MediaQuery.of(context).size.width/25,
                top: MediaQuery.of(context).size.height/4.8
            ),
            child: reportsIconContainer(shadowColor: const Color(0XFFc2e1e2)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/3,
                right: MediaQuery.of(context).size.width/25,
                top: MediaQuery.of(context).size.height/2.49
            ),
            child: reportsIconContainer(shadowColor: const Color(0XFFe6b4c3)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,
                right: MediaQuery.of(context).size.width/2,
                top: MediaQuery.of(context).size.height/2.49
            ),
            child: reportsIconContainer(shadowColor: const Color(0xFFddc8ee)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/15,
                right: MediaQuery.of(context).size.width/2,
                top: MediaQuery.of(context).size.height/1.68
            ),
            child: reportsIconContainer(shadowColor: const Color(0XFFa3d5ee)),
          ),
          /*         Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width/4.5,
                right: MediaQuery.of(context).size.width/3.5,
                top: MediaQuery.of(context).size.height/6
            ),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width/4.2,
              mainAxisSpacing: MediaQuery.of(context).size.width/3.5,
              children: [
                ReportsIconContainer(shadowColor: const Color(0xFFc8d5ee)),
                ReportsIconContainer(shadowColor: const Color(0XFFc2e1e2)),
                ReportsIconContainer(shadowColor: const Color(0xFFddc8ee)),
                ReportsIconContainer(shadowColor: const Color(0XFFe6b4c3)),
                ReportsIconContainer(shadowColor: const Color(0XFFa3d5ee)),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
