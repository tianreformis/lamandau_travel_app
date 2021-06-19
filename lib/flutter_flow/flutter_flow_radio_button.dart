/*
 * Copyright 2020 https://github.com/TercyoStorck
 *
 * Source code has been modified by FlutterFlow, Inc.
 * 
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice, 
 * this list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form must reproduce the above copyright notice, 
 * this list of conditions and the following disclaimer in the 
 * documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS 
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:flutter/material.dart';

class FlutterFlowRadioButton extends StatefulWidget {
  const FlutterFlowRadioButton({
    @required this.options,
    @required this.onChanged,
    this.optionHeight,
    this.textStyle,
    this.textPadding = EdgeInsets.zero,
    this.buttonPosition,
    this.direction,
    this.radioButtonColor,
    this.toggleable,
    this.horizontalAlignment,
    this.verticalAlignment,
  });

  final List<String> options;
  final Function(String) onChanged;
  final double optionHeight;
  final TextStyle textStyle;
  final EdgeInsetsGeometry textPadding;
  final RadioButtonPosition buttonPosition;
  final Axis direction;
  final Color radioButtonColor;
  final bool toggleable;
  final WrapAlignment horizontalAlignment;
  final WrapCrossAlignment verticalAlignment;

  @override
  State<FlutterFlowRadioButton> createState() => _FlutterFlowRadioButtonState();
}

class _FlutterFlowRadioButtonState extends State<FlutterFlowRadioButton> {
  String groupValue;
  List<String> get effectiveOptions =>
      widget.options.isEmpty ? ['[Option]'] : widget.options;

  @override
  void initState() {
    groupValue = effectiveOptions.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>.builder(
      direction: widget.direction,
      groupValue: groupValue,
      onChanged: (value) => setState(() {
        groupValue = value;
      }),
      activeColor: widget.radioButtonColor,
      toggleable: widget.toggleable,
      textStyle: widget.textStyle,
      textPadding: widget.textPadding,
      optionHeight: widget.optionHeight,
      horizontalAlignment: widget.horizontalAlignment,
      verticalAlignment: widget.verticalAlignment,
      items: effectiveOptions,
      itemBuilder: (item) =>
          RadioButtonBuilder(item, buttonPosition: widget.buttonPosition),
    );
  }
}

enum RadioButtonPosition {
  right,
  left,
}

class RadioButtonBuilder<T> {
  RadioButtonBuilder(
    this.description, {
    this.buttonPosition,
  });

  final String description;
  final RadioButtonPosition buttonPosition;
}

class RadioButton<T> extends StatelessWidget {
  const RadioButton({
    @required this.description,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.buttonPosition,
    this.activeColor,
    this.toggleable,
    this.textStyle,
    this.textPadding,
  });

  final String description;
  final T value;
  final T groupValue;
  final void Function(T) onChanged;
  final RadioButtonPosition buttonPosition;
  final Color activeColor;
  final bool toggleable;
  final TextStyle textStyle;
  final EdgeInsetsGeometry textPadding;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          if (onChanged != null) {
            onChanged(value);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (buttonPosition == RadioButtonPosition.right)
              Padding(
                padding: textPadding,
                child: Text(
                  description,
                  style: textStyle,
                ),
              ),
            Radio<T>(
              groupValue: groupValue,
              onChanged: onChanged,
              value: value,
              activeColor: activeColor,
              toggleable: toggleable,
            ),
            if (buttonPosition == RadioButtonPosition.left)
              Padding(
                padding: textPadding,
                child: Text(
                  description,
                  style: textStyle,
                ),
              ),
          ],
        ),
      );
}

class RadioGroup<T> extends StatelessWidget {
  const RadioGroup.builder({
    @required this.groupValue,
    @required this.onChanged,
    @required this.items,
    @required this.itemBuilder,
    this.direction,
    this.optionHeight,
    this.horizontalAlignment,
    this.activeColor,
    this.toggleable,
    this.textStyle,
    this.textPadding,
    this.verticalAlignment = WrapCrossAlignment.center,
  });

  final T groupValue;
  final List<T> items;
  final RadioButtonBuilder Function(T value) itemBuilder;
  final void Function(T) onChanged;
  final Axis direction;
  final double optionHeight;
  final WrapAlignment horizontalAlignment;
  final WrapCrossAlignment verticalAlignment;
  final Color activeColor;
  final bool toggleable;
  final TextStyle textStyle;
  final EdgeInsetsGeometry textPadding;

  List<Widget> get _group => items.map(
        (item) {
          final radioButtonBuilder = itemBuilder(item);

          return Container(
            height: optionHeight,
            child: RadioButton(
              description: radioButtonBuilder.description,
              value: item,
              groupValue: groupValue,
              onChanged: onChanged,
              buttonPosition: radioButtonBuilder.buttonPosition,
              activeColor: activeColor,
              toggleable: toggleable,
              textStyle: textStyle,
              textPadding: textPadding,
            ),
          );
        },
      ).toList();

  @override
  Widget build(BuildContext context) => direction == Axis.horizontal
      ? Wrap(
          direction: direction,
          alignment: horizontalAlignment,
          children: _group,
        )
      : Wrap(
          direction: direction,
          crossAxisAlignment: verticalAlignment,
          children: _group,
        );
}
