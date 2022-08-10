// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/modules/web+view/webview_screen.dart';

Widget defualtformfaild({
  required TextEditingController conttroler,
  required TextInputType type,
  Function? onSubmit,
  Function? onchanged,
  required valedit,
  required String? title,
  required IconData preicon,
  Function? ontap,
}) =>
    TextFormField(
      controller: conttroler,
      keyboardType: type,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onchanged!(s);
      },
      validator: valedit,
      onTap: () {
        ontap!();
      },
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(preicon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
      ),
    );

Widget tasksbuild(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.00,
              child: Text(
                '${model['time']}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(width: 20.00),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisSize: MainAxisSize.min,

                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.00),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_box_rounded),
              color: Colors.green,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.archive_rounded),
              color: Colors.black54,
            ),
          ],
        ),
      ),
      onDismissed: (direction) {},
    );

Widget tasksbuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
          itemBuilder: ((context, index) => tasksbuild(tasks[index], context)),
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
          itemCount: tasks.length),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.menu,
              size: 55,
              color: Colors.black54,
            ),
            Text(
              "No Tasks Yet , Please Add Some Tasks",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            )
          ],
        ),
      ),
    );

Widget buildArticalitems(listart, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewscreen(listart['url']));
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${listart['urlToImage']}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "${listart['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${listart['publishedAt']}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
