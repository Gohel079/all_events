import 'package:event_book_task/model/music_response_model.dart';
import 'package:event_book_task/screen/web_view/web_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventList extends StatefulWidget {
  List<Item> dataList;
  CommonResponseModel commonResponseModel;

  EventList(this.dataList, this.commonResponseModel, {super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {

  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            widget.commonResponseModel.request?.category ?? "",
            style: const TextStyle(
                fontSize: 20, color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          actions:  [

            InkWell(onTap: (){
              setState(() {
                isGrid = !isGrid;
              });
            },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(isGrid ? Icons.list :Icons.grid_view,
                  color: Colors.white,
                  size: 20,),
              ),
            )
          ],
        ),
        body:  isGrid ? gridList() :

      ListView.builder(
          itemBuilder: (context, index) {
            return singleItem(widget.dataList[index]);
            // return gridViewItem(widget.dataList[index]);
          },
          itemCount: widget.dataList.length),
    );
  }

  Widget singleItem(Item item) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) =>
                  WebViewScreen(
                      item.eventUrl ?? '', item.eventnameRaw ?? ""),));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        // Adjust the value for more/less rounded corners
                        child: Image.network(
                          item.bannerUrl ?? "",
                          // width: 200,
                          height: 130,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.eventname ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.startTimeDisplay ?? "",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.venue?.city ?? "",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,
                                  bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                        Border.all(color: Colors.black26)),
                                    child: Icon(
                                      Icons.upload,
                                      size: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                        Border.all(color: Colors.black26)),
                                    child: Icon(
                                      Icons.star_border_outlined,
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }


  Widget gridViewItem(Item item) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:
      Container(
        decoration: BoxDecoration( color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        height: 250,
        // width: 200,

        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                // Adjust the value for more/less rounded corners
                child: Image.network(
                  item.bannerUrl ?? "",
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    item.eventname ?? "",
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    item.startTimeDisplay ?? "",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    item.venue?.city ?? "",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 11,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                    ]
                      ),
            )
      ],
      ),
    ));
  }


  Widget gridList() {
    return GridView.builder(
        itemCount: widget.dataList.length, // Number of items in the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          // crossAxisSpacing: 10.0, // Spacing between columns
          // mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemBuilder: (BuildContext context, int index) {
          return gridViewItem(widget.dataList[index]);
        }
    );
  }
}
