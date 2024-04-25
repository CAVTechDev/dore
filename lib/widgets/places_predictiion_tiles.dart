// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:dore/assistants/request_assistant.dart';
import 'package:dore/global/mapkey.dart';
import 'package:dore/models/predicted_places.dart';
import 'package:dore/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';


class PlacesPredictionTileDesign extends StatefulWidget {
 
  final PredictedPlaces? predictedPlaces;

  PlacesPredictionTileDesign({this.predictedPlaces});

  @override
  State<PlacesPredictionTileDesign> createState() => _PlacesPredictionTileDesignState();
}

class _PlacesPredictionTileDesignState extends State<PlacesPredictionTileDesign> {


  getPlaceDirectionDetails(String? placeId, context) async {
    showDialog(
      context: context, 
      builder:(BuildContext context) => ProgressDialog(
        message: "Setting up Drop-off, please wait......",
      ));


      String placeDirectionDetailsurl = "https://maps.gooogleapis.com/maps/api/place/details/json?/place_id=$placeId&key=$mapKey";
      
      var responseApi = await RequestAssistant.receiveRequest(placeDirectionDetailsurl);

      Navigator.pop(context);

      // if(responseApi = "Error occured. Failed to response"){
      //   return  
      // }
  }
  
  @override
  
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:(){

      }, 
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,),
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Row(
          children: [
            Icon(Icons.add_location, color: Colors.green[400],),

            const SizedBox(width: 10,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.predictedPlaces!.main_text!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: Colors.green[400]),
                  )
                ],
              ),
            )
          ],
        ),
      ));
  }
}