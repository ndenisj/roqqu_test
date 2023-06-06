import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
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
        const SizedBox(height: 20),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuySellTextFieldContainer(),
              ],
            ),
          ),
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

class BuySellTextFieldContainer extends StatelessWidget {
  const BuySellTextFieldContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: RoqquTheme.of(context).inputBorderColor!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  'Limit price',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(width: 5),
                Icon(
                  Remix.information_line,
                  size: 15,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ],
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                hintText: '0.00',
              ),
            ),
          ),
          Text(
            'USD',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
