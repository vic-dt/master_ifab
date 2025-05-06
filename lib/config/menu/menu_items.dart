import 'package:flutter/material.dart';


class MenuItem {
final String titulus;
final String subTitulus;
final String link;
final IconData icon;

const MenuItem ({
  required this.titulus,
  required this.subTitulus,
  required this.link,
  required this.icon,
});

}


const appMenuItems = <MenuItem>[

  MenuItem(
    titulus: 'Contador', 
    subTitulus: 'Introducción a Riverpod', 
    link: '/numerator-river', 
    icon: Icons.add
  ),

  MenuItem(
    titulus: 'App con videos', 
    subTitulus: 'Control de videos verticales', 
    link: '/videos', 
    icon: Icons.video_call_outlined
  ),

  MenuItem(
    titulus: 'Aplicación con sockets', 
    subTitulus: 'Comunicación en tiempo real', 
    link: '/bands', 
    icon: Icons.music_note_outlined
  ),

  MenuItem(
    titulus: 'Gestión de temas', 
    subTitulus: 'Modo dark, light, colores...', 
    link: '/theme-mutante', 
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    titulus: 'Sensores del dispositivo', 
    subTitulus: 'Acelerómetro, magnetó...', 
    link: '/sensors', 
    icon: Icons.sensors_rounded
  ),

  MenuItem(
    titulus: 'Moviendo un círculo', 
    subTitulus: 'Manejo del giroscopio', 
    link: '/gyroscope', 
    icon: Icons.downloading
  ),

  MenuItem(
    titulus: 'Ubicación del usuario', 
    subTitulus: 'Localización y seguimiento', 
    link: '/location', 
    icon: Icons.pin_drop_outlined
  ),

  MenuItem(
    titulus: 'PokèApi', 
    subTitulus: 'Peticiones http a una Api', 
    link: '/request', 
    icon: Icons.catching_pokemon
  ),

	MenuItem(
    titulus: 'Animated container', 
    subTitulus: 'Stateful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    titulus: 'ShoesApp', 
    subTitulus: 'UI y Widgets personalizados', 
    link: '/shoes', 
    icon: Icons.add_shopping_cart
  ),

  MenuItem(
    titulus: 'InfiniteScroll', 
    subTitulus: 'Y acción de pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded
  ),

];
