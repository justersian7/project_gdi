import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:project/components/default_button.dart';
import 'package:project/constant.dart';
import 'package:project/size_config.dart';

class CreateProjectForm extends StatefulWidget {
  @override
  _CreateProjectFormState createState() => _CreateProjectFormState();
}

class Employee {
  final String id;
  final String name;
  final String title;

  Employee({
    this.id,
    this.name,
    this.title,
  });
}

List<Employee> _selectedEmployees = [];

class _CreateProjectFormState extends State<CreateProjectForm> {
  final _formKey = GlobalKey<FormState>();
  final _salesmanKey = GlobalKey<FormFieldState>();
  final _inChargeKey = GlobalKey<FormFieldState>();
  String id;
  String title;
  String company;
  String date = DateTime.now().toString();
  List<String> salesman;
  List<String> member;

  static List<Employee> _employee = [
    Employee(id: '1', name: 'Andy', title: 'salesman'),
    Employee(id: '2', name: 'John', title: 'salesman'),
    Employee(id: '3', name: 'Peter', title: 'programmer'),
    Employee(id: '4', name: 'Luke', title: 'programmer'),
  ];
  final _salesmans = _employee
      .where((emplo) => emplo.title == 'salesman')
      .map((employee) => MultiSelectItem<Employee>(employee, employee.name))
      .toList();
  final _inCharge = _employee
      .where((emplo) => emplo.title == 'programmer')
      .map((employee) => MultiSelectItem<Employee>(employee, employee.name))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTitleFormField(),
          SizedBox(
            height: getScreenWidth(20),
          ),
          buildCompanyFormField(),
          SizedBox(
            height: getScreenWidth(20),
          ),
          buildDateFormField(),
          SizedBox(
            height: getScreenWidth(20),
          ),
          Container(
            height: getScreenWidth(110),
            padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(12),
              vertical: getScreenWidth(5),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kTextColor),
            ),
            child: Column(
              children: <Widget>[
                MultiSelectDialogField<Employee>(
                  buttonIcon: Icon(
                    Icons.add,
                    color: kPrimaryColor,
                  ),
                  // decoration: BoxDecoration(color: Colors.white),
                  key: _salesmanKey,
                  title: Text("Select Salesman"),
                  buttonText: Text(
                    'Salesman',
                    style: TextStyle(fontSize: 16),
                  ),
                  items: _salesmans,
                  barrierColor: kTextColor.withOpacity(0.5),
                  listType: MultiSelectListType.CHIP,
                  searchable: true,
                  validator: (values) {
                    if (values == null || values.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  onConfirm: (values) {
                    setState(() {
                      _selectedEmployees = values;
                    });
                    _salesmanKey.currentState.validate();
                  },
                  selectedColor: kPrimaryColor,
                  selectedItemsTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  chipDisplay: MultiSelectChipDisplay(
                    chipColor: kPrimaryColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getScreenWidth(20),
          ),
          Container(
            height: getScreenWidth(110),
            padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(12),
              vertical: getScreenWidth(5),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kTextColor),
            ),
            child: MultiSelectDialogField<Employee>(
              buttonIcon: Icon(
                Icons.add,
                color: kPrimaryColor,
              ),
              // decoration: BoxDecoration(color: Colors.white),
              key: _inChargeKey,
              title: Text("Select Team Members"),
              buttonText: Text(
                'Team Members',
                style: TextStyle(fontSize: 16),
              ),
              items: _inCharge,
              barrierColor: kTextColor.withOpacity(0.5),
              listType: MultiSelectListType.CHIP,
              searchable: true,
              validator: (values) {
                if (values == null || values.isEmpty) {
                  return 'Required';
                }
                return null;
              },
              onConfirm: (values) {
                setState(() {
                  _selectedEmployees = values;
                });
                _salesmanKey.currentState.validate();
              },
              selectedColor: kPrimaryColor,
              selectedItemsTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              chipDisplay: MultiSelectChipDisplay(
                chipColor: kPrimaryColor,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: getScreenWidth(50),
          ),
          DefaultButton(
            text: 'Create Project',
            press: () {
              if (_formKey.currentState.validate()) {
                // _formKey.currentState.save();
                // Navigator.pushNamed(context, ProjectHomeScreen.routeName);
                print(title);
                print(company);
                print(date);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildTitleFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) => title = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Required';
        }
      },
      decoration: InputDecoration(
        labelText: "Title",
        hintText: "Enter Project Title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.edit,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField buildCompanyFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) => company = value,
      validator: (value) {
        if (value.isEmpty) {
          return 'Required';
        }
      },
      decoration: InputDecoration(
        labelText: "Company",
        hintText: "Enter Company Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.edit,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  TextFormField buildDateFormField() {
    DateTime selectedDate = DateTime.now();
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(
          text: DateFormat.yMMMd().format(DateTime.parse(date)).toString()),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDatePicker(
          currentDate: selectedDate,
          context: context,
          initialDate:
              selectedDate == null ? DateTime.now() : DateTime.parse(date),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
        ).then((selectedDate) {
          // ignore: unnecessary_statements
          selectedDate == null ? () {} : date = selectedDate.toString();
        });
      },
      onSaved: (newValue) => date = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Date",
        hintText: "Enter Date",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.calendar_today_outlined,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
