import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageApp extends StatefulWidget {
  const StorageApp({super.key});

  @override
  State<StorageApp> createState() => _StorageAppState();
}

class _StorageAppState extends State<StorageApp> {
  final _controller = TextEditingController();
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  void _save() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("username", text);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("saved")));
  }

  void _load() async {
    final preferences = await SharedPreferences.getInstance();
    final data = preferences.getString("username");
    setState(() {
      text = data ?? "no data found";
    });
    preferences.remove("username");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                // obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Username",
                  // border: OutlineInputBorder(),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
              SizedBox(height: 25),
              Text("your data : $text"),
              SizedBox(height: 25),
              ElevatedButton(onPressed: _save, child: Text("save")),
            ],
          ),
        ),
      ),
    );
  }
}
