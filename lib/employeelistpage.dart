import 'package:apicrud/addemployee.dart';
import 'package:apicrud/employeeupdate.dart';
import 'package:apicrud/mainapi.dart';
import 'package:flutter/material.dart';

class Employee_details extends StatefulWidget {
  const Employee_details({super.key});

  @override
  State<Employee_details> createState() => _Employee_detailsState();
}

class _Employee_detailsState extends State<Employee_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmployeeList'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => Add_Employee()
                    )
                ).then((value){
                  if(value!=null && value)
                    {
                      setState(() {

                      });
                    }
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text(snapshot.data![index]['name']),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Update_Employee(
                                      employee: snapshot.data![index],
                                    )
                                )
                            ).then((value) {
                              if(value!=null && value)
                                {
                                  setState(() {

                                  });
                                }
                            });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          mainapi()
                              .Deleteusers(snapshot.data![index]['id'])
                              .then((value) {
                            setState(() {});
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
        future: mainapi().Getusers(),
      ),
    );
  }
}
