import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(useMaterial3: true),
      home: const BMIScreen(),
    );
  }
}

enum WeightUnit { kg, lb }
enum HeightUnit { m, cm, ftIn }

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _weightCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController(); // for m/cm
  final TextEditingController _feetCtrl = TextEditingController();
  final TextEditingController _inchCtrl = TextEditingController();

  WeightUnit _weightUnit = WeightUnit.kg;
  HeightUnit _heightUnit = HeightUnit.cm;

  double? _bmi; // keep full precision internally
  String _category = '';
  Color _color = Colors.grey;

  // ---------------- Conversions ----------------
  double poundsToKg(double lb) => lb * 0.45359237;
  double cmToMeters(double cm) => cm / 100.0;
  double feetInchToMeters(double ft, double inch) => (ft * 12 + inch) * 0.0254;

  // ---------------- Validation Helpers ----------------
  String? _validateNumber(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    final n = double.tryParse(v);
    if (n == null) return 'Invalid number';
    if (n < 0) return 'Must be positive';
    return null;
  }

  // ---------------- BMI ----------------
  void _calculate() {
    if (!_formKey.currentState!.validate()) return;

    double weightKg;
    double heightM;

    // Weight
    final w = double.parse(_weightCtrl.text);
    weightKg = _weightUnit == WeightUnit.kg ? w : poundsToKg(w);

    // Height
    if (_heightUnit == HeightUnit.m) {
      heightM = double.parse(_heightCtrl.text);
    } else if (_heightUnit == HeightUnit.cm) {
      heightM = cmToMeters(double.parse(_heightCtrl.text));
    } else {
      double ft = double.tryParse(_feetCtrl.text) ?? 0;
      double inch = double.tryParse(_inchCtrl.text) ?? 0;

      // carry inches >= 12
      if (inch >= 12) {
        final extraFt = (inch ~/ 12);
        ft += extraFt;
        inch = inch % 12;
        _feetCtrl.text = ft.toStringAsFixed(0);
        _inchCtrl.text = inch.toStringAsFixed(1);
      }

      heightM = feetInchToMeters(ft, inch);
    }

    if (heightM <= 0) {
      _showSnack('Height must be > 0');
      return;
    }

    final bmi = weightKg / (heightM * heightM);

    String cat;
    Color color;

    if (bmi < 18.5) {
      cat = 'Underweight';
      color = Colors.blue;
    } else if (bmi < 25) {
      cat = 'Normal';
      color = Colors.green;
    } else if (bmi < 30) {
      cat = 'Overweight';
      color = Colors.orange;
    } else {
      cat = 'Obese';
      color = Colors.red;
    }

    setState(() {
      _bmi = bmi;
      _category = cat;
      _color = color;
    });
  }

  void _clear() {
    _weightCtrl.clear();
    _heightCtrl.clear();
    _feetCtrl.clear();
    _inchCtrl.clear();
    setState(() {
      _bmi = null;
      _category = '';
      _color = Colors.grey;
    });
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Weight', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _weightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      decoration: const InputDecoration(
                        hintText: 'Enter weight',
                        border: OutlineInputBorder(),
                      ),
                      validator: _validateNumber,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SegmentedButton<WeightUnit>(
                    segments: const [
                      ButtonSegment(value: WeightUnit.kg, label: Text('kg')),
                      ButtonSegment(value: WeightUnit.lb, label: Text('lb')),
                    ],
                    selected: {_weightUnit},
                    onSelectionChanged: (s) => setState(() => _weightUnit = s.first),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text('Height', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),

              SegmentedButton<HeightUnit>(
                segments: const [
                  ButtonSegment(value: HeightUnit.m, label: Text('m')),
                  ButtonSegment(value: HeightUnit.cm, label: Text('cm')),
                  ButtonSegment(value: HeightUnit.ftIn, label: Text('ft+in')),
                ],
                selected: {_heightUnit},
                onSelectionChanged: (s) => setState(() => _heightUnit = s.first),
              ),

              const SizedBox(height: 12),

              if (_heightUnit == HeightUnit.m || _heightUnit == HeightUnit.cm)
                TextFormField(
                  controller: _heightCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                  decoration: InputDecoration(
                    hintText: _heightUnit == HeightUnit.m ? 'Enter meters (e.g., 1.72)' : 'Enter cm (e.g., 170)',
                    border: const OutlineInputBorder(),
                  ),
                  validator: _validateNumber,
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _feetCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                        decoration: const InputDecoration(
                          labelText: 'Feet',
                          border: OutlineInputBorder(),
                        ),
                        validator: _validateNumber,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _inchCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                        decoration: const InputDecoration(
                          labelText: 'Inch',
                          border: OutlineInputBorder(),
                        ),
                        validator: _validateNumber,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _calculate,
                      child: const Text('Calculate'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _clear,
                      child: const Text('Clear'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              if (_bmi != null)
                Card(
                  color: _color.withOpacity(0.15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('BMI: ${_bmi!.toStringAsFixed(1)}',
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Chip(
                                label: Text(_category),
                                backgroundColor: _color,
                                labelStyle: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.favorite, color: _color),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
