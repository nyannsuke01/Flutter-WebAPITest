import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwcourses/model/course.dart';

class CourseDetailPage extends StatelessWidget{
  final Course course;

  const CourseDetailPage({Key key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(course.name)),
      body: Text('Course detail'),
    );
  }
}