import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class CustomOnboardingSlidingSegmentedControl extends StatefulWidget {
  final List<String> children;
  final ValueChanged<int> onValueChanged;

  const CustomOnboardingSlidingSegmentedControl({
    super.key,
    required this.children,
    required this.onValueChanged,
  });

  @override
  _CustomOnboardingSlidingSegmentedControlState createState() =>
      _CustomOnboardingSlidingSegmentedControlState();
}

class _CustomOnboardingSlidingSegmentedControlState
    extends State<CustomOnboardingSlidingSegmentedControl>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onValueChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('$index');
    _controller.reset();
    _controller.forward();
    widget.onValueChanged(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: context.colors.darkBlue,
      ),
      child: Stack(
        children: [
          Row(
            children: List.generate(widget.children.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onValueChanged(index),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.children[index],
                        style: TextStyle(
                          color: context.colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          AnimatedAlign(
            alignment: Alignment(
              _selectedIndex == 0
                  ? (_selectedIndex * 2 - 4) / 4
                  : _selectedIndex == 2
                      ? (_selectedIndex * 2 - 2.5) / 4
                      : _selectedIndex == 3
                          ? (_selectedIndex * 2 - 2) / 4
                          : (_selectedIndex * 2 - 3.5) / 4,
              0,
            ),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              width: widget.children.length == 2
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colors.blueGradient,
                    context.colors.lightBlueGradient,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  widget.children[_selectedIndex],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: context.colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
