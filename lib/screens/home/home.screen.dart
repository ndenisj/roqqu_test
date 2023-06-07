import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:roqqu_test/screens/home/home.controller.dart';
import 'package:roqqu_test/screens/home/widgets/buy_tab.widget.dart';
import 'package:roqqu_test/screens/home/widgets/charts_tab.widget.dart';
import 'package:roqqu_test/screens/home/widgets/open_order_tab.widget.dart';
import 'package:roqqu_test/screens/home/widgets/orderbook_tab.widget.dart';
import 'package:roqqu_test/screens/home/widgets/recent_trade_tab.widget.dart';
import 'package:roqqu_test/shared_widgets/generic.widgets.dart';
import 'package:roqqu_test/shared_widgets/roqqu_button.widget.dart';
import 'package:roqqu_test/styles/assets.manager.dart';
import 'package:roqqu_test/styles/roqqu.colors.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';
import 'package:roqqu_test/trials.dart';
import 'package:roqqu_test/utils.dart';

import 'widgets/coin_change.widget.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeController controller = Get.find();

  late TabController _tabController;
  late TabController _orderTabController;
  late TabController _buySellTabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _orderTabController = TabController(vsync: this, length: 3);
    _buySellTabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _orderTabController.dispose();
    _buySellTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            const Divider(height: 0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCoinDropdownSection(context),
                    thickDivider(context),
                    _buildChartSection(context),
                    thickDivider(context),
                    const SizedBox(height: 8),
                    _buildOrderSection(context),
                    ElevatedButton(
                      onPressed: () {
                        if (Theme.of(context).brightness == Brightness.dark) {
                          setAppThemeModeSetting(context, ThemeMode.light);
                        } else {
                          setAppThemeModeSetting(context, ThemeMode.dark);
                        }
                      },
                      child: const Text('clikc'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottomNavBar() {
    return Container(
      height: Get.height * 0.1,
      padding: const EdgeInsets.all(20),
      color: RoqquTheme.of(context).secondaryBackground,
      child: Row(
        children: [
          Expanded(
            child: RoqquButton(
              onTap: () => _buildBottomSheet(context),
              text: 'Buy',
              height: 35,
              color: successColor,
              borderRadius: 10,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: RoqquButton(
              onTap: () {
                Get.to(() => MyPage());
              },
              text: 'Sell',
              height: 35,
              color: alertColor,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: Get.height * 0.8,
          child: Column(
            children: [
              _buildBuySellTab(context),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _buySellTabController,
                  children: const [
                    BuyTabWidget(),
                    BuyTabWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            Get.isDarkMode
                ? ImageAssets.dark_mode_logo
                : ImageAssets.light_mode_logo,
          ),
          Row(
            children: [
              Image.asset(
                ImageAssets.user,
                width: Get.width * 0.09,
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: const Icon(Remix.global_line),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Remix.menu_2_fill),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoinDropdownSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: Get.height * 0.15,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(ImageAssets.coin_icon),
              const SizedBox(width: 10),
              Text(
                'BTC/USDT',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Icon(
                Remix.arrow_down_s_line,
              ),
              const SizedBox(width: 10),
              Text(
                '\$20,634',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: successColor,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoinChangeWidget(
                    icon: Remix.time_line,
                    changeLabel: '24h change',
                    changeValue: '520.80 +1.25%',
                    isSuccess: true,
                  ),
                  SizedBox(width: 5),
                  CoinChangeWidget(
                    icon: Remix.arrow_up_line,
                    changeLabel: '24h high',
                    changeValue: '${controller.high} +1.25%',
                    isSuccess: false,
                  ),
                  SizedBox(width: 5),
                  CoinChangeWidget(
                    icon: Remix.arrow_down_line,
                    changeLabel: '24h low',
                    changeValue: '${controller.low} +1.25%',
                    isSuccess: false,
                  ),
                  SizedBox(width: 5),
                  CoinChangeWidget(
                    icon: Remix.bar_chart_2_line,
                    changeLabel: '24h volume',
                    changeValue: '${controller.volume} +1.25%',
                    isSuccess: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.6,
      child: Column(
        children: [
          SizedBox(width: Get.width),
          Padding(
            padding: const EdgeInsets.all(10),
            child: _mainTab(context),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ChartsTabWidget(),
                const OrderBookTabWidget(),
                const RecentTradesTabWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSection(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          SizedBox(width: Get.width),
          Padding(
            padding: const EdgeInsets.all(10),
            child: _orderTab(context),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _orderTabController,
              children: const [
                OpenOrderTabWidget(),
                OpenOrderTabWidget(),
                OpenOrderTabWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuySellTab(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RoqquTheme.of(context).primaryBackground,
      ),
      child: TabBar(
        controller: _buySellTabController,
        indicator: BoxDecoration(
          border: Border.all(color: successColor),
          borderRadius: BorderRadius.circular(10),
          color: RoqquTheme.of(context).secondaryBackground,
          boxShadow: Get.isDarkMode
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1,
                    spreadRadius: 2,
                  ),
                ],
        ),
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelColor: RoqquTheme.of(context).primaryText,
        unselectedLabelColor: RoqquTheme.of(context).secondaryText,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: const [
          Tab(text: 'Buy'),
          Tab(text: 'Sell'),
        ],
      ),
    );
  }

  Widget _mainTab(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RoqquTheme.of(context).secondaryColor,
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: RoqquTheme.of(context).activeTabColor,
          boxShadow: Get.isDarkMode
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1,
                    spreadRadius: 2,
                  ),
                ],
        ),
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelColor: RoqquTheme.of(context).primaryText,
        unselectedLabelColor: RoqquTheme.of(context).secondaryText,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: const [
          Tab(text: 'Charts'),
          Tab(text: 'Orderbook'),
          Tab(text: 'Recent trades'),
        ],
      ),
    );
  }

  Widget _orderTab(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RoqquTheme.of(context).secondaryColor,
      ),
      child: TabBar(
        controller: _orderTabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: RoqquTheme.of(context).activeTabColor,
          boxShadow: Get.isDarkMode
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 1,
                    spreadRadius: 2,
                  ),
                ],
        ),
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelColor: RoqquTheme.of(context).primaryText,
        unselectedLabelColor: RoqquTheme.of(context).secondaryText,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: const [
          Tab(text: 'Open Orders'),
          Tab(text: 'Positions'),
          Tab(text: 'Order History'),
        ],
      ),
    );
  }
}
