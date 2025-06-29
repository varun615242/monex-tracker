import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import 'package:trackizer/common_widget/icon_item_row.dart';
import 'package:trackizer/common_widget/icon_item_switch_row.dart' as switch_row;

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset("assets/img/back.png",
                            width: 25, height: 25, color: TColor.gray30))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(color: TColor.gray30, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/u1.png", width: 70, height: 70),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "varun pothurajula",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "varun.pothurajuladi@gmail.com",
                  style: TextStyle(
                      color: TColor.gray30,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 15),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PlaceholderPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: TColor.border.withOpacity(0.15),
                  ),
                  color: TColor.gray60.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Edit profile",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle("General"),
                  SettingsCard(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "Security",
                        icon: "assets/img/face_id.png",
                        value: "FaceID",
                      ),
                    ),
                    IconItemSwitchRow(
                      title: "iCloud Sync",
                      icon: "assets/img/icloud.png",
                      value: isActive,
                      didChange: (newVal) {
                        setState(() {
                          isActive = newVal;
                        });
                      },
                    ),
                  ]),
                  const SectionTitle("My subscription"),
                  SettingsCard(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "Sorting",
                        icon: "assets/img/sorting.png",
                        value: "Date",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "Summary",
                        icon: "assets/img/chart.png",
                        value: "Average",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "Default currency",
                        icon: "assets/img/money.png",
                        value: "USD (\$)",
                      ),
                    ),
                  ]),
                  const SectionTitle("Appearance"),
                  SettingsCard(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "App icon",
                        icon: "assets/img/app_icon.png",
                        value: "Default",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "Theme",
                        icon: "assets/img/light_theme.png",
                        value: "Dark",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PlaceholderPage()));
                      },
                      child: IconItemRow(
                        title: "Font",
                        icon: "assets/img/font.png",
                        value: "Inter",
                      ),
                    ),
                  ]),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
            color: TColor.white, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const SettingsCard({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: TColor.border.withOpacity(0.1),
        ),
        color: TColor.gray60.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        title: const Text("Coming Soon", style: TextStyle(color: Colors.white)),
        backgroundColor: TColor.gray60,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text("This screen is under development",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
