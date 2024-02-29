import 'package:biometric_demo/custom_radio_button.dart';
import 'package:flutter/material.dart';

class NoticeDialogBox extends StatefulWidget {
  const NoticeDialogBox({super.key});

  @override
  State<NoticeDialogBox> createState() => _NoticeDialogBoxState();
}

class _NoticeDialogBoxState extends State<NoticeDialogBox> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();
  bool isChecked = false;
  int? _isRadioSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stateful Dialog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _textEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Enter any text";
                    },
                    decoration:
                        const InputDecoration(hintText: "Please Enter Text"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Choice Box"),
                      Checkbox(
                          value: isChecked,
                          onChanged: (checked) {
                            setState(() {
                              isChecked = checked!;
                            });
                          })
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    // color: Colors.grey,
                    child: Row(
                      children: [
                        CustomRadioButton(
                          label: 'Fault',
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          value: 1,
                          groupValue: _isRadioSelected,
                          onChanged: (newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                        CustomRadioButton(
                          label: 'Not At Fault',
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          value: 0,
                          groupValue: _isRadioSelected,
                          onChanged: (newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                        CustomRadioButton(
                          label: 'Both',
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          value: 2,
                          groupValue: _isRadioSelected,
                          onChanged: (newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class StatefulDialog extends StatefulWidget {
  const StatefulDialog({super.key});

  @override
  State<StatefulDialog> createState() => _StatefulDialogState();
}

class _StatefulDialogState extends State<StatefulDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();
  bool isChecked = false;

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Enter any text";
                        },
                        decoration: const InputDecoration(
                            hintText: "Please Enter Text"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Choice Box"),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked!;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              title: const Text('Stateful Dialog'),
              actions: <Widget>[
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('OK'),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stateful Dialog'),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _textEditingController,
                    validator: (value) {
                      return value!.isNotEmpty ? null : "Enter any text";
                    },
                    decoration:
                        const InputDecoration(hintText: "Please Enter Text"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Choice Box"),
                      Checkbox(
                          value: isChecked,
                          onChanged: (checked) {
                            setState(() {
                              isChecked = checked!;
                            });
                          })
                    ],
                  )
                ],
              )),
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('OK'),
            ),
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // Do something like updating SharedPreferences or User Settings etc.
                Navigator.of(context).pop();
              }
            },
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await showInformationDialog(context);
                },
                child: const Text(
                  "Stateful Dialog",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}
