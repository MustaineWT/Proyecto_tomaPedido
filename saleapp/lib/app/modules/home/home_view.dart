import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'local_widget/AppBarPersonalize.dart';
import 'local_widget/MenuDrawer.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, 40),
          child: AppBarPersonalize(
            onlogout: _.onLogout,
            value: _.values,
            title: _.nameOpcions,
            searchController: _.searchControllers,
            onChange: _.onChangedSearch,
            valor: 1,
          ),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: MenuDrawer(
            onPressedClient: () {
              _.onPressedOpcion(true, 1);
              Get.back();
            },
            onPressedOrders: () {
              _.onPressedOpcion(true, 2);
              Get.back();
            },
            onPressedArticles: () {
              _.onPressedOpcion(true, 3);
              Get.back();
            },
            onPressedReports: () {
              _.onPressedOpcion(true, 4);
              Get.back();
            },
            onPressedSetting: () {
              _.onPressedOpcion(true, 5);
              Get.back();
            },
            onPressedInformation: () {
              _.onPressedOpcion(true, 6);
              Get.back();
            },
            stateColorClient: _.stateColorSelectClient,
            stateColorOrders: _.stateColorSelectOrders,
            stateColorArticle: _.stateColorSelectArticle,
            stateColorReport: _.stateColorSelectReport,
            stateColorSetting: _.stateColorSelectSetting,
            stateColorInformation: _.stateColorSelectInformation,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: _.listWidgets[_.values],
        ),
      ),
    );
  }
}
