import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:roqqu_test/styles/roqqu.colors.dart';
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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuySellTextFieldContainer(title: 'Limit price'),
                SizedBox(height: 20),
                BuySellTextFieldContainer(title: 'Amount'),
                SizedBox(height: 20),
                BuySellTextFieldContainer(
                  title: 'Type',
                  showDropdown: true,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Remix.checkbox_blank_line,
                      size: 15,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    SizedBox(width: 5),
                    Text('Post Only'),
                    SizedBox(width: 10),
                    Icon(
                      Remix.information_line,
                      size: 15,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    Text('0.00'),
                  ],
                ),
                SizedBox(height: 20),
                GradientButton(),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total account value'),
                        Text(
                          '0.00',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Text(
                      'NGN',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Open Orders'),
                        Text(
                          '0.00',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Available'),
                        Text(
                          '0.00',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Deposit'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          gradientColor1,
          gradientColor2,
          gradientColor3,
        ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text('Buy BTC'),
      ),
    );
  }
}

class BuySellTextFieldContainer extends StatelessWidget {
  final String title;
  final bool showDropdown;

  const BuySellTextFieldContainer({
    required this.title,
    this.showDropdown = false,
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
                  title,
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
          showDropdown
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Good till cancelled',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.normal),
                        textAlign: TextAlign.end,
                      ),
                      Icon(Remix.arrow_down_s_line),
                    ],
                  ),
                )
              : SizedBox(),
          !showDropdown
              ? Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.end,
                    decoration: const InputDecoration(
                      hintText: '0.00',
                    ),
                  ),
                )
              : SizedBox(),
          !showDropdown
              ? Text(
                  'USD',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.normal),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
