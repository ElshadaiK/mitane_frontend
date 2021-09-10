import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/machinery/bloc/machinery_blocs.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/MachineryAdmin_Lists.dart';
// import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';
import 'package:mitane_frontend/route_generator.dart';

class AdminMachineryEdit extends StatefulWidget {
  static const String routeName = '/admin/machineries/edit';

  final MachineryArgument argument;
  AdminMachineryEdit({ required this.argument });

  @override
  _AdminMachineryEditState createState() => _AdminMachineryEditState();
}

class _AdminMachineryEditState extends State<AdminMachineryEdit> {

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _machinery = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Machinery",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdminMachineries.routeName);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: widget.argument.machinery.name,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "Machinery Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter machinery name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._machinery["name"] = value;
                      });
                  }),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    MitaneButton(
                      onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final MachineryEvent event = MachineryAdminUpdate(
                              Machinery(
                                id: widget.argument.machinery.id,
                                name: this._machinery['name'],
                              ),
                            );
                      BlocProvider.of<MachineryBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AdminMachineries.routeName, (route) => false);
                    }
                    }, title: "Edit Machinery", )
                  ])
                ],
              ))
        ],
      ),
    ));
  }
}
