import 'package:flutter/material.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

class BuyTabWidget extends StatefulWidget {
  const BuyTabWidget({super.key});

  @override
  State<BuyTabWidget> createState() => _BuyTabWidgetState();
}

class _BuyTabWidgetState extends State<BuyTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _buySubTabController;

  @override
  void initState() {
    super.initState();
    _buySubTabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _buySubTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBuySubTab(context),
        SizedBox(height: 20),
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildBuySubTab(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TabBar(
        controller: _buySubTabController,
        isScrollable: false,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: RoqquTheme.of(context).activeTabColor!.withOpacity(0.5),
        ),
        // labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelColor: RoqquTheme.of(context).primaryText,
        unselectedLabelColor: RoqquTheme.of(context).secondaryText,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: const [
          Tab(text: 'Limit'),
          Tab(text: 'Market'),
          Tab(text: 'Stop-Limit'),
        ],
      ),
    );
  }
}
