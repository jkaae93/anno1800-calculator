import 'dart:io';

import 'package:anno_calc/models/citizen.dart';
import 'package:anno_calc/models/demands_model.dart';
import 'package:anno_calc/models/goods.dart';
import 'package:anno_calc/models/populration.dart';
import 'package:anno_calc/models/product.dart';
import 'package:anno_calc/utils/enums.dart';
import 'package:anno_calc/views/style/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:steps_indicator/steps_indicator.dart';

class IslandsView extends StatelessWidget {
  final String name;
  final List<Populration> population;
  final List<Goods> specialties;
  final List<Goods> productions;

  const IslandsView({
    super.key,
    required this.name,
    required this.population,
    required this.specialties,
    required this.productions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Text(name),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.edit_rounded)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (population.isNotEmpty)
              ItemLists(
                name: 'population'.tr,
                widgets: List.generate(population.length, (index) {
                  return CitizenCounter(
                    readOnly: true,
                    count: population[index].count,
                    name: population[index].name,
                    useResidences: false,
                    onChanged: (value) {},
                  );
                }),
              ),
            if (specialties.isNotEmpty)
              ItemLists(
                name: 'specialties'.tr,
                widgets: specialties.map((e) => ItemView(count: e.type, name: e.name)).toList(),
              ),
            if (productions.isNotEmpty)
              ItemLists(
                name: 'production'.tr,
                widgets: productions.map((e) => ItemView(count: e.type, name: e.name)).toList(),
              ),
          ],
        )
      ],
    );
  }
}

class ItemView extends StatelessWidget {
  final String name;
  final int count;
  const ItemView({super.key, required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Image.asset(
              Styles.getProductImg(name),
              width: 40,
              height: 40,
              errorBuilder: (ctx, e, s) => Container(height: 40, width: 40, color: Colors.black38),
            ),
          ),
          AutoSizeText(name, style: context.theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class ItemLists extends StatelessWidget {
  final String name;
  final List<Widget> widgets;
  const ItemLists({super.key, this.name = '', required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Wrap(children: widgets),
        ],
      ),
    );
  }
}

class ItemSelecter extends StatefulWidget {
  final String product;
  final Function(bool) onChanged;
  final bool isEnabled;
  const ItemSelecter({super.key, required this.product, required this.onChanged, this.isEnabled = true});

  @override
  State<ItemSelecter> createState() => _ItemSelecterState();
}

class _ItemSelecterState extends State<ItemSelecter> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    double width = 230;
    if (!widget.isEnabled) return Container();
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: width,
        height: 50,
        child: Row(
          children: [
            Checkbox(
              value: _isSelected,
              onChanged: (v) {
                setState(() {
                  _isSelected = v ?? _isSelected;
                  widget.onChanged(_isSelected);
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 35,
              height: 35,
              child: Image.asset(
                Styles.getProductImg(widget.product),
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 35,
                  height: 35,
                  color: Colors.black26,
                ),
              ),
            ),
            AutoSizeText(
              widget.product,
              style: context.theme.textTheme.titleSmall,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class CitizenCounter extends StatefulWidget {
  final String name;
  final bool useResidences;
  final int count;
  final int rate;
  final Function(int) onChanged;
  final bool readOnly;
  const CitizenCounter({
    super.key,
    required this.name,
    required this.useResidences,
    required this.count,
    required this.onChanged,
    this.rate = 10,
    this.readOnly = false,
  });

  @override
  State<CitizenCounter> createState() => _CitizenCounterState();
}

class _CitizenCounterState extends State<CitizenCounter> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = '${widget.count}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Styles.getProfileImg(widget.name),
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 64,
                  height: 64,
                  color: Colors.black26,
                ),
              ),
              if (widget.useResidences)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.clear_rounded),
                    Text('${widget.rate}'),
                  ],
                ),
            ],
          ),
          AutoSizeText(widget.name, style: context.theme.textTheme.titleSmall),
          widget.readOnly
              ? AutoSizeText('${widget.count}')
              : TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    isDense: true,
                    constraints: const BoxConstraints.expand(width: 70, height: 30),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  onChanged: (v) {
                    widget.onChanged(int.tryParse(v) ?? 0);
                  },
                ),
        ],
      ),
    );
  }
}

class GoodsList extends StatelessWidget {
  final int population;
  final List<DemandsGoods> goods;
  final bool useResidence;
  final int rate;
  const GoodsList({super.key, required this.goods, this.population = 0, this.useResidence = false, this.rate = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: 800,
      child: GridView.builder(
        itemCount: goods.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
          childAspectRatio: 1.2 / 2,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          double count = population * goods[index].rate;
          if (useResidence) count *= rate;
          return GoodsView(img: Styles.getProductImg(goods[index].name), count: count, name: goods[index].name);
        },
      ),
    );
  }
}

class GoodsView extends StatelessWidget {
  final String img;
  final String name;
  final double count;
  const GoodsView({super.key, required this.img, required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            width: 40,
            height: 40,
            errorBuilder: (c, e, s) => Container(
              width: 40,
              height: 40,
              color: Colors.black45,
            ),
          ),
          AutoSizeText(
            name,
            style: context.theme.textTheme.subtitle1,
            maxLines: 1,
          ),
          AutoSizeText(
            count.toStringAsFixed(3),
            style: context.theme.textTheme.subtitle2,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class TradeSummary extends StatelessWidget {
  final String name;
  final List<String> route;
  final int duration;
  final List<Goods> products;
  final Function onClick;
  const TradeSummary({super.key, this.name = '', required this.route, required this.products, this.duration = 0, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(name),
            StepsIndicator(
              lineLength: 100,
              nbSteps: route.length + 1,
              selectedStep: 1,
              unselectedStepWidget: AutoSizeText(route.first),
              selectedStepWidget: Container(
                child: Text('$duration'),
              ),
              doneStepWidget: AutoSizeText(route.last),
            ),
            Row(
              children: products.map((e) => ItemView(name: e.name, count: e.quantity)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ResidentItemView extends StatelessWidget {
  final List<Widget> counter;
  const ResidentItemView({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: counter,
      ),
    );
  }
}

class TradeSelecter extends StatefulWidget {
  final String product;
  final Function(bool, int) onChanged;
  final bool isEnabled;
  const TradeSelecter({super.key, required this.product, required this.onChanged, this.isEnabled = true});

  @override
  State<TradeSelecter> createState() => _TradeSelecterState();
}

class _TradeSelecterState extends State<TradeSelecter> {
  bool _isSelected = false;
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    double width = 300;
    if (!widget.isEnabled) return Container();
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: width,
        height: 50,
        child: Row(
          children: [
            Checkbox(
              value: _isSelected,
              onChanged: (v) {
                setState(() {
                  _isSelected = v ?? _isSelected;
                  widget.onChanged(_isSelected, _quantity);
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 35,
              height: 35,
              child: Image.asset(
                Styles.getProductImg(widget.product),
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 35,
                  height: 35,
                  color: Colors.black26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: AutoSizeText(
                widget.product,
                style: context.theme.textTheme.titleSmall,
                maxLines: 1,
              ),
            ),
            TextField(
              style: context.theme.textTheme.bodyMedium,
              decoration: const InputDecoration(
                constraints: BoxConstraints.expand(height: 30, width: 50),
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              ),
              onChanged: (v) {
                _quantity = int.tryParse(v) ?? 0;
                widget.onChanged(_isSelected, _quantity);
              },
            ),
          ],
        ),
      ),
    );
  }
}
