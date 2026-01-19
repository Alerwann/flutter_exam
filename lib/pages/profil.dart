import 'package:dailyfamilymessage/provider/profil_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final profil = Provider.of<ProfilProvider>(context, listen: false);
    _pseudoController.text = profil.pseudo;
    _cityController.text = profil.city;
  }

  @override
  void dispose() {
    _pseudoController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your profil")),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Consumer<ProfilProvider>(
          builder: (context, profil, child) {
            return Center(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                      TextFormField(
                        controller: _pseudoController,
                        decoration: InputDecoration(
                          hintText: profil.pseudo,
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Pseudo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Champs du pseudo vide";
                          }
                          return null;
                        },
                        maxLength: 20,
                      ),
                      TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          hintText: profil.pseudo,
                          prefixIcon: Icon(Icons.apartment_sharp),
                          labelText: 'City',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Champs du pseudo vide";
                          }
                          return null;
                        },
                        maxLength: 20,
                      ),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<ProfilProvider>(
                                context,
                                listen: false,
                              ).setAll(
                                _pseudoController.text,
                                _cityController.text,
                              );
                              FocusScope.of(context).requestFocus(FocusNode());
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Pseudo mis à jour avec succès !',
                                ),
                              ),
                            );
                          },
                          label: Text(
                            'Enregistrer le pseudo',
                            textAlign: TextAlign.center,
                          ),
                          icon: Icon(Icons.check_box, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
