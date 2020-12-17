// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'package:animations/src/basics/home_screen.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Zhenia/Desktop/network_request_tutorial-master/lib/home_screen.dart';


import '01_animated_container.dart';
import '02_page_route_builder.dart';
import '03_animation_controller.dart';
import '04_tweens.dart';
import '05_animated_builder.dart';
import '06_custom_tween.dart';
import '07_tween_sequence.dart';
import '08_fade_transition.dart';
import 'animated_list.dart';
import 'animated_positioned.dart';
import 'animated_switcher.dart';
import 'carousel.dart';
import 'expand_card.dart';
import 'focus_image.dart';
import 'hero_animation.dart';
import 'physics_card_drag.dart';
import 'repeating_animation.dart';

void main() => runApp(AnimationSamples());

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}

final basicDemos = [
  Demo(
      name: 'Json',
      route: HomeScreenDemo.routeName,
      builder: (context) => HomeScreenDemo()),
  Demo(
      name: 'AnimatedContainer',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => AnimatedContainerDemo()),
  Demo(
      name: 'Page Route Builder',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => PageRouteBuilderDemo()),
  Demo(
      name: 'Animation Controller',
      route: AnimationControllerDemo.routeName,
      builder: (context) => AnimationControllerDemo()),
  Demo(
      name: 'Money Rise/Down',
      route: TweenDemo.routeName,
      builder: (context) => TweenDemo()),
  Demo(
      name: 'Animated Builder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => AnimatedBuilderDemo()),
  Demo(
      name: 'Custom Tween',
      route: CustomTweenDemo.routeName,
      builder: (context) => CustomTweenDemo()),
  Demo(
      name: 'Tween Sequences',
      route: TweenSequenceDemo.routeName,
      builder: (context) => TweenSequenceDemo()),
  Demo(
      name: 'Fade Transition',
      route: FadeTransitionDemo.routeName,
      builder: (context) => FadeTransitionDemo()),
  Demo(
      name: 'Expandable Card',
      route: ExpandCardDemo.routeName,
      builder: (context) => ExpandCardDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Focus Image',
      route: FocusImageDemo.routeName,
      builder: (context) => FocusImageDemo()),
  Demo(
      name: 'Repeating Animation',
      route: RepeatingAnimationDemo.routeName,
      builder: (context) => RepeatingAnimationDemo()),
  Demo(
      name: 'Spring Physics',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => PhysicsCardDragDemo()),
  Demo(
      name: 'Animated List',
      route: AnimatedListDemo.routeName,
      builder: (context) => AnimatedListDemo()),
  Demo(
      name: 'Animated Positioned',
      route: AnimatedPositionedDemo.routeName,
      builder: (context) => AnimatedPositionedDemo()),
  Demo(
      name: 'Animated Switcher',
      route: AnimatedSwitcherDemo.routeName,
      builder: (context) => AnimatedSwitcherDemo()),
  Demo(
      name: 'Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => HeroAnimationDemo()),
];

final basicDemoRoutes =
Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));


final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,

};

class AnimationSamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Samples',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Examples'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Animation', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(d)),

        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}
