import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String userName = "Luna";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _menuLateral(),
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(AppAssets.logo, height: 65),
                  const SizedBox(height: 20),
                  Text(
                    "${AppTexts.homeWelcomePrefix}, $userName!",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(AppTexts.homeSafetyMessage),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _mostrarPanelDeNiveles(context),
                    child: Image.asset(
                      AppAssets.btnSos,
                      width: 280,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.menu_open, size: 30),
              onPressed: () => _key.currentState!.openDrawer(),
            ),
          ),
        ],
      ),
    );
  }

  // 1. FUNCIÓN DEL MENÚ LATERAL
  Widget _menuLateral() {
    return const Drawer();
  }

  // 2. FUNCIÓN QUE MUESTRA EL PANEL (MODAL)
  void _mostrarPanelDeNiveles(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                AppTexts.homeModalTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                AppTexts.homeSelectLevel,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNivelBotton(
                    AppTexts.alertMin,
                    AppAssets.iconoMinimo,
                    AppColors.warningYellow,
                  ),
                  _buildNivelBotton(
                    AppTexts.alertMod,
                    AppAssets.iconoModerado,
                    AppColors.warningOrange,
                  ),
                  _buildNivelBotton(
                    AppTexts.alertMax,
                    AppAssets.iconoMaximo,
                    AppColors.warningRed,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // 3. LA "FÁBRICA" DE BOTONES DE NIVEL (Esto quita el rojo)
  Widget _buildNivelBotton(
    String etiqueta,
    String rutaImagen,
    Color colorFondo,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("Presionaste: $etiqueta");
            Navigator.pop(context); // Cierra el panel al tocar uno
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: colorFondo,
            child: Image.asset(rutaImagen, width: 35),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          etiqueta,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: colorFondo,
          ),
        ),
      ],
    );
  }
}
