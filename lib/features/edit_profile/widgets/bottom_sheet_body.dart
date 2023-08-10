import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import 'alert_dialog_body.dart';

class bottomSheetBody extends StatelessWidget {
  const bottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
        height: 200,
        child: Column(
          children:
          [
            Center(
              child: Container(
                width: 50,
                height: 2.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children:
              [
                Expanded(
                  child: Text(
                    'profile photo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    AssetData.deleteIcon,
                  ),
                  onTap: ()
                  {
                    showDialog(
                        context: context,
                        builder: (context)=>alertDialogBody(),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children:
              [
                Expanded(
                  child: Column(
                    children:
                    [
                      InkWell(
                        child: Image.asset(
                          AssetData.galleryIcon,
                        ),
                        onTap: (){},
                      ),
                      SizedBox(height: 5,),
                      Text('Gallery',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black54),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children:
                    [
                      InkWell(
                        child: Image.asset(
                          AssetData.cameraIcon,
                        ),
                        onTap: (){},
                      ),
                      SizedBox(height: 5,),
                      Text('Camera',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black54),),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children:
                    [
                      InkWell(
                        child: Image.asset(
                          AssetData.avatarIcon,
                        ),
                        onTap: (){},
                      ),
                      SizedBox(height: 5,),
                      Text('Avatar',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black54),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
