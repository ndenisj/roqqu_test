import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

class ChartsTabWidget extends StatefulWidget {
  const ChartsTabWidget({super.key});

  @override
  State<ChartsTabWidget> createState() => _ChartsTabWidgetState();
}

class _ChartsTabWidgetState extends State<ChartsTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _timeTabController;

  @override
  void initState() {
    super.initState();
    _timeTabController = TabController(vsync: this, length: 10);
  }

  @override
  void dispose() {
    _timeTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _subTab(context),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }

  Widget _subTab(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 30,
      child: TabBar(
        controller: _timeTabController,
        isScrollable: true,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: RoqquTheme.of(context).activeTabColor,
        ),
        // labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelColor: RoqquTheme.of(context).primaryText,
        unselectedLabelColor: RoqquTheme.of(context).secondaryText,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: [
          const Tab(text: 'Time'),
          const Tab(text: '1H'),
          const Tab(text: '2H'),
          const Tab(text: '4H'),
          const Tab(text: '1D'),
          const Tab(text: '1W'),
          const Tab(text: '1M'),
          const Tab(icon: Icon(Remix.arrow_down_s_line)),
          const Tab(icon: Icon(Remix.line_chart_line)),
          const Tab(text: 'Fx Indicators'),
        ],
      ),
    );
  }
}
