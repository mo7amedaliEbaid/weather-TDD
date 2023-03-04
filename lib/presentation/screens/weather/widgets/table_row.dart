import 'package:flutter/material.dart';

TableRow WeatherTableRow(String label, String value){
  return  TableRow(
      children: [
         Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ), // Will be change later
      ]
  );
}