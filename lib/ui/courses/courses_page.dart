

import 'package:flutter/material.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/course_repository.dart';
import 'package:rwcourses/ui/course_detail/course_detail_page.dart';
import '../../constants.dart';
import 'courses_controller.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: _controller.fetchCourses(Constants.allFilter),
        builder: (context, snapshot) {
          var courses = snapshot.data;
          if (courses == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int position){
              return _buildRow(courses[position]);
            }
          );
        });
  }
  Widget _buildRow(Course course){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(course.name, style: TextStyle(fontSize: 18.0)),
        ),

        subtitle: Text(course.domainsString),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            course.artworkUrl,
          ),
        ),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(
                course: course,
              ),
            ),
          );
        },
      ),
    );
  }
}
