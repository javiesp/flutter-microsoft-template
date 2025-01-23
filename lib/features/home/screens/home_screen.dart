import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:breadcrumbs/breadcrumbs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFd62f33);
    const secondaryColor = Color(0xFFFFF0EF);
    const tertiaryColor = Color(0xFF904A46); 

    const List<String> departments = <String>['One', 'Two', 'Three', 'Four']; 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tertiaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.person),
              color: secondaryColor,
              onPressed: () {/* ... */},
            ),
            Text(
              'LOGO',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              color: secondaryColor,
              onPressed: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Breadcrumbs(
                  crumbs: [
                    TextSpan(text: 'Menú'),
                    TextSpan(text: 'Formularios'),
                    TextSpan(text: 'Online'),
                  ],
                  separator: ' / ',
                  style: TextStyle(color: tertiaryColor),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Búsqueda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.search, color: tertiaryColor),
                    fillColor: tertiaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DepartmentDropdown(departments: departments, tertiaryColor: tertiaryColor), 
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const CardExample(),
              ),
            ),
            // ELIMINAR
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const CardExample(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const CardExample(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const CardExample(),
              ),
            ),
            // ELIMINAR
          ],
        ),
      ),
    );
  }
}

class DepartmentDropdown extends StatefulWidget {
  const DepartmentDropdown({super.key, required this.departments, required this.tertiaryColor});

  final List<String> departments;
  final Color tertiaryColor;

  @override
  State<DepartmentDropdown> createState() => _DepartmentDropdownState();
}

class _DepartmentDropdownState extends State<DepartmentDropdown> {
  late String selectedDepartment;

  @override
  void initState() {
    super.initState();
    selectedDepartment = widget.departments.first; 
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.departments.first,
      onSelected: (String? value) {
        setState(() {
          selectedDepartment = value!;
        });
      },
      dropdownMenuEntries: widget.departments.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
      label: const Text('Departamento'),
      textStyle: TextStyle(color: widget.tertiaryColor), 
    );
  }
}

// Clase listar cards

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Formulario 1'),
              subtitle: Text('Descripción de formulario'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Añadir respuesta'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Ver respuestas'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
