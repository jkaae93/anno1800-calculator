import 'package:anno_calc/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitizenCalcView extends StatefulWidget {
  const CitizenCalcView({super.key});

  @override
  State<CitizenCalcView> createState() => _CitizenCalcViewState();
}

class _CitizenCalcViewState extends State<CitizenCalcView> {
  CalcType _calcType = CalcType.all;
  bool _isOnRegidenceMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: CalcType.values
                .map(
                  (e) => SizedBox(
                    width: 300,
                    child: RadioListTile<CalcType>(
                      dense: true,
                      value: e,
                      groupValue: _calcType,
                      onChanged: (v) {
                        setState(() {
                          _calcType = v ?? CalcType.all;
                        });
                      },
                      title: Text('$e'),
                      subtitle: const Text('subtitles'),
                      activeColor: Colors.lightBlue,
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            children: [
              const Text('insert to people count'),
              Switch(
                value: _isOnRegidenceMode,
                onChanged: (v) {
                  setState(() {
                    _isOnRegidenceMode = true;
                  });
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CitizenInputBox(
                types: CitizenTypes.values,
                regionName: 'OLD + TREL',
              ),
              CitizenInputBox(
                types: CitizenTypes.values,
                regionName: 'NEW',
              ),
              CitizenInputBox(
                types: CitizenTypes.values,
                regionName: 'ENBESA',
              ),
              CitizenInputBox(
                types: CitizenTypes.values,
                regionName: 'ARCTIC',
              ),
            ],
          ),
          const Text('outputs'),
        ],
      ),
    );
  }
}

class CitizenInputBox extends StatefulWidget {
  final dynamic types;
  final String regionName;
  const CitizenInputBox({super.key, required this.types, required this.regionName});

  @override
  State<CitizenInputBox> createState() => _CitizenInputBoxState();
}

class _CitizenInputBoxState extends State<CitizenInputBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(widget.regionName),
        ),
        Wrap(
            children: widget.types
                .regionsInfo<Widget>((e) => InputView(
                      hint: e.toString(),
                      onChanged: (v) => {},
                    ))
                .toList()),
      ],
    );
  }
}

class InputView extends StatelessWidget {
  final String hint;
  final int unit;
  final Function(int) onChanged;
  InputView({super.key, this.hint = '', this.unit = 0, required this.onChanged});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blueGrey))),
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              isDense: true,
              constraints: const BoxConstraints.expand(width: 200, height: 80),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            onChanged: (v) {
              onChanged(int.tryParse(v) ?? 0);
            },
          ),
        ],
      ),
    );
  }
}
