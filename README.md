# Contador de Metas UMG — Tarea Flutter

Tarea de Programación II (UMG). Es una app Flutter basada en el contador del tutorial, con cambios propios.

## Personalizaciones realizadas

| Requisito | Cambio |
|---|---|
| Edición de textos | Título "Contador de Metas UMG", "Metas cumplidas hoy:", mensajes de diálogo y aviso en español |
| Botón adicional | `ElevatedButton` "Ver mi progreso": abre un `AlertDialog` e imprime en consola. `TextButton` "Reiniciar": reinicia el contador y muestra un `SnackBar` |
| Cambio de diseño | Colores verde azulado y naranja, fondo menta, íconos `school`, `flag_circle`, `add_task` y `emoji_events`, número de 72 px |

## Ejecutar

```bash
flutter pub get
flutter run -d chrome      # versión web
flutter run                # emulador/dispositivo Android
```
