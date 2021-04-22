import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../components/default_button.dart';
import '../../../constant.dart';
import '../../Project_Home/project_home_screen.dart';
import '../../../size_config.dart';

class CreateProjectForm extends StatefulWidget {
  @override
  _CreateProjectFormState createState() => _CreateProjectFormState();
}

class Employee {
  final String ids;
  final String names;
  final String titles;

  Employee({
    this.ids,
    this.names,
    this.titles,
  });
}

List<Employee> selectedEmployees = [];

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
    Employee(ids: '1', names: 'Andy', titles: 'salesman'),
    Employee(ids: '2', names: 'John', titles: 'salesman'),
    Employee(ids: '3', names: 'Peter', titles: 'programmer'),
    Employee(ids: '4', names: 'Luke', titles: 'programmer'),
  ];
  final _salesmans = _employee
      .where((emplo) => emplo.titles == 'salesman')
      .map((employee) => MultiSelectItem<Employee>(employee, employee.names))
      .toList();
  final _inCharge = _employee
      .where((emplo) => emplo.titles == 'programmer')
      .map((employee) => MultiSelectItem<Employee>(employee, employee.names))
      .toList();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              Scaffold.of(context).appBarMaxHeight,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(
                getScreenWidth(20),
              ),
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
                      horizontal: getScreenWidth(10),
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
                              selectedEmployees.addAll(values);
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
                      horizontal: getScreenWidth(10),
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
                          key: _inChargeKey,
                          title: Text("Select Team Members"),
                          buttonText: Text(
                            'Team Member',
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
                              selectedEmployees.addAll(values);
                            });
                            _inChargeKey.currentState.validate();
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
                  Spacer(),
                  DefaultButton(
                    text: 'Create Project',
                    press: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.pushNamed(
                            context, ProjectHomeScreen.routeName);
                        print(title);
                        print(company);
                        print(date);
                        selectedEmployees.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
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
        return null;
      },
      decoration: InputDecoration(
        labelText: "Title",
        hintText: "Enter Project Title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getScreenWidth(20)),
          child: Icon(
            Icons.edit,
            color: kPrimaryColor,
          ),
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
        return null;
      },
      decoration: InputDecoration(
        labelText: "Company",
        hintText: "Enter Company Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getScreenWidth(20)),
          child: Icon(
            Icons.edit,
            color: kPrimaryColor,
          ),
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
          currentDate:
              selectedDate == null ? DateTime.now() : DateTime.parse(date),
          context: context,
          initialDate:
              selectedDate == null ? DateTime.now() : DateTime.parse(date),
          firstDate: selectedDate,
          lastDate: DateTime(DateTime.now().year + 1),
          errorInvalidText: 'Invalid Date',
        ).then(
          (selectedDate) {
            // ignore: unnecessary_statements
            selectedDate == null ? () {} : date = selectedDate.toString();
          },
        );
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
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getScreenWidth(20)),
          child: Icon(
            Icons.calendar_today_outlined,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
