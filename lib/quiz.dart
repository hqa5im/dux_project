import 'package:flutter/material.dart';

// START OF ROLES SELECT STATE //
class MultiSelect extends StatefulWidget {
  final List<String> roles;
  const MultiSelect({Key? key, required this.roles}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  String? _selectedRole;

  void _roleChange(String roleValue) {
    setState(() {
      _selectedRole = roleValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Roles'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.roles.map((role) {
            return RadioListTile<String>(
              value: role,
              groupValue: _selectedRole,
              title: Text(role),
              onChanged: (String? newValue) {
                _roleChange(role);
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(
              context, _selectedRole != null ? [_selectedRole!] : []),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
// END OF ROLES SELECT STATE //

// START OF LOCATION SELECT STATE //
class MultiSelect2 extends StatefulWidget {
  final List<String> location;
  const MultiSelect2({Key? key, required this.location}) : super(key: key);

  @override
  State<MultiSelect2> createState() => _MultiSelectState2();
}

class _MultiSelectState2 extends State<MultiSelect2> {
  String? _selectedLocation;

  void _roleChange(String roleValue) {
    setState(() {
      _selectedLocation = roleValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Location'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.location.map((role) {
            return RadioListTile<String>(
              value: role,
              groupValue: _selectedLocation,
              title: Text(role),
              onChanged: (String? newValue) {
                _roleChange(role);
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(
              context, _selectedLocation != null ? [_selectedLocation!] : []),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
// END OF LOCATION SELECT STATE //

// START OF LANGUAGE SELECT STATE //
class MultiSelect3 extends StatefulWidget {
  final List<String> language;
  const MultiSelect3({Key? key, required this.language}) : super(key: key);

  @override
  State<MultiSelect3> createState() => _MultiSelectState3();
}

class _MultiSelectState3 extends State<MultiSelect3> {
  List<String> _selectedLanguage = [];

  void _roleChange(String roleValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedLanguage.add(roleValue);
      } else {
        _selectedLanguage.remove(roleValue);
      }
    });
  }

  // this function is called when the cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

  // this function is called when the save button is pressed
  void _save() {
    Navigator.pop(context, _selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Language'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.language
            .map((role) => CheckboxListTile(
                  value: _selectedLanguage.contains(role),
                  title: Text(role),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? isSelected) {
                    _roleChange(role, isSelected!);
                  },
                ))
            .toList(),
      )),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
// END OF LANGUAGE SELECT STATE //

// START OF PREFERENCES SELECT STATE //
class MultiSelect4 extends StatefulWidget {
  final List<String> preference;
  const MultiSelect4({Key? key, required this.preference}) : super(key: key);

  @override
  State<MultiSelect4> createState() => _MultiSelectState4();
}

class _MultiSelectState4 extends State<MultiSelect4> {
  List<String> _selectedPreference = [];

  void _roleChange(String roleValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedPreference.add(roleValue);
      } else {
        _selectedPreference.remove(roleValue);
      }
    });
  }

  // this function is called when the cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

  // this function is called when the save button is pressed
  void _save() {
    Navigator.pop(context, _selectedPreference);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Travel Preferences'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.preference
            .map((role) => CheckboxListTile(
                  value: _selectedPreference.contains(role),
                  title: Text(role),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? isSelected) {
                    _roleChange(role, isSelected!);
                  },
                ))
            .toList(),
      )),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
// END OF TRAVEL PREFERENCES SELECT STATE //

// quiz page UI
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<String> _selectedRoles = [];
  List<String> _selectedLocation = [];
  List<String> _selectedLanguage = [];
  List<String> _selectedPreference = [];

  // roles single select
  void _showSingleSelect1() async {
    final List<String> roles = ['Tourist', 'Tour Guide'];

    final List<String>? selectedRoles = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(roles: roles);
      },
    );

    // updates UI
    if (selectedRoles != null) {
      setState(() {
        _selectedRoles = selectedRoles;
      });
    }
  }

  // location multi select
  void _showSingleSelect2() async {
    final List<String> location = [
      'Doha',
      'Lahore',
      'Dubai',
      'London',
      'Paris'
    ];

    final List<String>? selectedLocation = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect2(location: location);
      },
    );

    // updates UI
    if (selectedLocation != null) {
      setState(() {
        _selectedLocation = selectedLocation;
      });
    }
  }

  // language multi select
  void _showMultiSelect3() async {
    final List<String> language = [
      'English',
      'Urdu',
      'Arabic',
      'French',
      'Spanish'
    ];

    final List<String>? selectedLanguage = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect3(language: language);
      },
    );

    // updates UI
    if (selectedLanguage != null) {
      setState(() {
        _selectedLanguage = selectedLanguage;
      });
    }
  }

  // travel preferences multi select
  void _showMultiSelect4() async {
    final List<String> preference = [
      'Cultural Immersion',
      'Adventure/Outdoor',
      'Activities',
      'Food and Culinary Exploration',
      'Historical Sightseeing',
      'Nightlife and Entertainment',
      'Relaxation'
    ];

    final List<String>? selectedPreference = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect4(preference: preference);
      },
    );

    // updates UI
    if (selectedPreference != null) {
      setState(() {
        _selectedPreference = selectedPreference;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 428,
                height: 926,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4699999988079071),
                ),
              ),
            ),
            Positioned(
              left: 43,
              top: 98,
              child: SizedBox(
                width: 343,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0A6C14),
                    fontSize: 35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),

            // question 1 box
            Positioned(
              left: 70,
              top: 185,
              child: ElevatedButton(
                onPressed: () {
                  _showSingleSelect1();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set to transparent
                  shadowColor: Colors.transparent, // Set to transparent
                ),
                child: Container(
                  width: 252,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0A6C14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFFCAD6FF),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Select Role',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // answer to question 1
            Positioned(
              left: 70,
              top: 250,
              child: Wrap(
                children: _selectedRoles
                    .map((role) => Chip(
                          label: Text(role),
                        ))
                    .toList(),
              ),
            ),

            // question 2 box
            Positioned(
              left: 70,
              top: 310,
              child: ElevatedButton(
                onPressed: () {
                  _showSingleSelect2();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set to transparent
                  shadowColor: Colors.transparent, // Set to transparent
                ),
                child: Container(
                  width: 252,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0A6C14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFFCAD6FF),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Location',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // answer to question 2
            Positioned(
              left: 70,
              top: 375,
              child: Wrap(
                children: _selectedLocation
                    .map((role) => Chip(
                          label: Text(role),
                        ))
                    .toList(),
              ),
            ),

            // question 3 box
            Positioned(
              left: 70,
              top: 435,
              child: ElevatedButton(
                onPressed: () {
                  _showMultiSelect3();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set to transparent
                  shadowColor: Colors.transparent, // Set to transparent
                ),
                child: Container(
                  width: 252,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0A6C14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFFCAD6FF),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Language',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // answer to question 3
            Positioned(
              left: 70,
              top: 500,
              child: Wrap(
                children: _selectedLanguage
                    .map((role) => Chip(
                          label: Text(role),
                        ))
                    .toList(),
              ),
            ),

            // question 4 box
            Positioned(
              left: 70,
              top: 560,
              child: ElevatedButton(
                onPressed: () {
                  _showMultiSelect4();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set to transparent
                  shadowColor: Colors.transparent, // Set to transparent
                ),
                child: Container(
                  width: 252,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0A6C14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFFCAD6FF),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Travel Preferences',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // answer to question 4
            Positioned(
              left: 70,
              top: 625,
              child: Wrap(
                children: _selectedPreference
                    .map((role) => Chip(
                          label: Text(role),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
