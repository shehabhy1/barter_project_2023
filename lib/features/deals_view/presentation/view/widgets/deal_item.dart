// // ListView.builder(physics: const NeverScrollableScrollPhysics()
// // ,
// // shrinkWrap: true
// // ,
// // itemCount: 3
// // ,
// // itemBuilder: (
// // context,index)=>
// // Container
// // (
// // padding: const EdgeInsets.all(8
// // )
// // ,
// // margin: const EdgeInsets.symmetric(vertical: 8
// // )
// // ,
// // color: Colors.white,child: Column
// // (
// // crossAxisAlignment: CrossAxisAlignment.start,children: [
// // Row
// // (
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
// // Container
// // (
// // child: Row
// // (
// // children: [
// // Padding
// // (
// // padding: const EdgeInsets.only(right: 8.0
// // )
// // ,
// // child: CircleAvatar
// // (
// // backgroundImage: const AssetImage('
// // assets/images/img_5.png')
// // ,
// // radius: MediaQuery.of(context).
// // size.width/15
// // ,
// // )
// // ,
// // )
// // ,
// // Column
// // (
// // crossAxisAlignment: CrossAxisAlignment.start,children: [
// // Text
// // ("Samantha Payne
// // "
// // ,
// // style: Styles.TextStyle14,)
// // ,
// // Padding
// // (
// // padding: const EdgeInsets.symmetric(vertical:4
// // )
// // ,
// // child: Text
// // ("@Sam.Payne90
// // "
// // ,
// // style: Styles.TextStyle12.copyWith(color: GREY),),
// // ),
// // ],
// // ),
// // ],
// // )
// // ,
// //
// // )
// // ,
// // RatingBarIndicator
// // (
// // unratedColor: Colors.grey[300
// // ]
// // ,
// // rating: 4.5
// // ,
// // itemBuilder: (
// // context, index) =>
// // Icon
// // (
// // Icons.star,color: MAIN_ORANGE,)
// // ,
// // itemCount: 5
// // ,
// // itemSize: MediaQuery.of(context).
// // size.width/15
// // ,
// // direction: Axis.horizontal,)
// // ,
// // ]
// // ,
// // )
// // ,
// // Padding
// // (
// // padding: const EdgeInsets.symmetric(vertical: 8.0
// // )
// // ,
// // child: Text
// // ("“The staff went above and beyond to ensure we had a comfortable stay and were kind enough to pack breakfast for us as we checked out really early in the morning. All little things, but truly unforgettable experience.”
// // "
// // ,
// // style: Styles.TextStyle14.copyWith(color: GREY,fontWeight: FontWeight.w400),
// // maxLines: isMore[index].
// // toString
// // (
// // )=='
// // true
// // '
// // ?
// // 10
// // :
// // 3
// // ,
// // overflow: TextOverflow.ellipsis,)
// // ,
// // )
// // ,
// // InkWell
// // (
// // onTap: (){
// // setState(() {
// // isMore[index]=!isMore[index];
// // });
// // },
// // child: Row
// // (
// // children: [
// // Text
// // (
// // isMore[index].
// // toString
// // (
// // )=='true'?"Show less" : "Show more"
// // ,
// // style: Styles.TextStyle12.copyWith(color: MAIN_ORANGE),
// // )
// // ,
// // Icon
// // (
// // isMore[index].
// // toString
// // (
// // )=='
// // true
// // '
// // ?
// // Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,size: 16
// // ,
// // color: MAIN_ORANGE,)
// // ]
// // ,
// // )
// // ,
// // )
// // ,
// // Padding
// // (
// // padding: const EdgeInsets.symmetric(vertical: 8.0
// // )
// // ,
// // child: Text
// // ("23 Nov 2022
// // "
// // ,
// // style: Styles.TextStyle12.copyWith(color: GREY),),
// // )
// // ],
// // ),
// // ))
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class DealItem extends StatefulWidget {
//   const DealItem({Key? key}) : super(key: key);
//
//   @override
//   State<DealItem> createState() => _DealItemState();
// }
//
// class _DealItemState extends State<DealItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8
//       ),
//       margin: const EdgeInsets.symmetric(
//           vertical: 8
//       ),
//       color: Colors.white,
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//           Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//       Container(
//       child: Row(
//       children: [
//           Padding(
//           padding: const EdgeInsets.only(right: 8.0
//       ),
//     ),
//     child: CircleAvatar(
//     backgroundImage: const AssetImage(assets/images/img_5.png'),
//     radius: MediaQuery.of(context).size.width/15,
//     ),
//     ),
//     Column(
//     crossAxisAlignment: CrossAxisAlignment.start,children: [
//     Text
//     ("Samantha Payne",
//     style: Styles.TextStyle14,
//     ),
//     Padding(
//     padding: const EdgeInsets.symmetric(vertical:4),
//     child: Text
//     ("@Sam.Payne90",
//     style: Styles.TextStyle12.copyWith(color: GREY),
//     ),
//     ),
//     ],
//     ),
//     ],
//     ),
//     ),
//     RatingBarIndicator(
//     unratedColor: Colors.grey[300
//     ],
//     rating: 4.5,
//     itemBuilder: (
//     context, index) =>Icon(
//     Icons.star,color: MAIN_ORANGE,
//     ),
//     itemCount: 5,
//     itemSize: MediaQuery.of(context).
//     size.width/15,
//     direction: Axis.horizontal,
//     ),
//     ],
//     ),
//     Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Text
//     ("“The staff went above and beyond to ensure we had a comfortable stay and were kind enough to pack breakfast for us as we checked out really early in the morning. All little things, but truly unforgettable experience.”",
//     style: Styles.TextStyle14.copyWith(
//     color: GREY,fontWeight: FontWeight.w400),
//     maxLines: isMore[index].toString(
//     )=='true'?10:3,
//     overflow: TextOverflow.ellipsis,
//     ),
//     ),
//     InkWell(
//     onTap: (){
//     setState(() {
//     isMore[index]=!isMore[index];
//     });
//     },
//     child: Row(
//     children: [
//     Text(
//     isMore[index].
//     toString(
//     )=='true'?"Show less" : "Show more",
//     style: Styles.TextStyle12.copyWith(color: MAIN_ORANGE),
//     ),
//     Icon(
//     isMore[index].
//     toString()=='true'?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,size: 16,
//     color: MAIN_ORANGE,
//     ),
//     ],
//     ),
//     ),
//     Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0
//     ),
//     child: Text("23 Nov 2022"
//     style: Styles.TextStyle12.copyWith(color: GREY),
//     ),
//     ),
//     ],
//     ),
//     ),
//   }
// }
