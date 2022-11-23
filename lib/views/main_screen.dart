import 'package:flutter/material.dart';
import 'package:meme_generator/controller/fetch_meme.dart';
import 'package:meme_generator/controller/save_meme.dart';
import 'package:meme_generator/resources/color_manager.dart';
import 'package:meme_generator/resources/style_manger.dart';
import 'package:share_plus/share_plus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int? memeNo;
  int? targetMeme = 10;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitMemeNo();
    updateImg();
  }

  getInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo! > 45) {
      targetMeme = 500;
    } else if (memeNo! > 500) {
      targetMeme = 1000;
    }
    setState(() {});
  }

  void updateImg() async {
    String getImgUrl = await FetchMeme.fetchMeme();
    // imgUrl = getImgUrl;
    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });
    print(imgUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.secondaryColor,
      drawer: Drawer(
        elevation: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Developed \nBy Abdul Sattar",
                style: StyleManager.styleManagerMethod(
                    18.0, ColorManger.primaryColor, FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Meme Generator App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Meme No: $memeNo",
              style: StyleManager.styleManagerMethod(
                20.0,
                Colors.deepPurple,
                FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Target Meme: $targetMeme",
              style: StyleManager.styleManagerMethod(
                20.0,
                Colors.deepPurple,
                FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManger.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 400,
                      width: double.infinity,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: ColorManger.secondaryColor,
                      )),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imgUrl,
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await SaveMyData.saveData(memeNo! + 1);
                        getInitMemeNo();
                        updateImg();
                        // setState(() {});
                        print(imgUrl);
                      },
                      child: const Text("For More Meme")),
                  InkWell(
                    onTap: () async {
                      imgUrl = (await SaveMyData.saveImgUrl(imgUrl))!;
                      // setState(() {});
                      print(imgUrl);
                      Share.share(imgUrl);
                      // Share.shareXFiles(imgUrl, text: "Shareing is Caring");
                    },
                    child: const Icon(
                      Icons.share_outlined,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
