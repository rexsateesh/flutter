import 'package:demo_provider/app_state.dart';
import 'package:demo_provider/inherited_widget_demo.dart';
import 'package:demo_provider/response_display.dart';
import 'package:demo_provider/text_display.dart';
import 'package:demo_provider/text_edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<AppState>(
          create: (_) => AppState(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Consumer demonstrated
                Container(
                  child: Consumer<AppState>(
                    builder: (context, appState, child) {
                      return Text(appState.consumerText);
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () =>
                      appState.setConsumerText('Hello Consumer text'),
                  child: Text('Say Hello To Consumer'),
                ),

                // Input button demonstrated
                TextDisplay(),
                TextEditWidget(),

                // Fetch data from Network and display
                RaisedButton(
                  onPressed: () => appState.fetchData(),
                  child: Text("Fetch Data from Network"),
                ),
                ResponseDisplay(),

                // Inherited Widget Example
                MyStatefulWidget(
                  child: MyContainer(
                    child: DummyContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CounterLabel(),
                          CounterValue(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
