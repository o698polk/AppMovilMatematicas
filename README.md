# MateAppPlus — Proporciones y Porcentajes

App educativa móvil para estudiantes de secundaria. Refuerza el aprendizaje de **proporciones, razones, porcentajes e interés simple** (objetivo curricular O.M.3.2) mediante videos, evaluaciones, galería, juegos y un sistema de progreso gamificado.

---

## ¿De qué trata?

MateAppPlus acompaña al estudiante en temas de:

- Proporcionalidad directa e inversa  
- Razones y regla de tres  
- Porcentajes y descuentos  
- Facturas e IVA (19 %)  
- Interés simple  

El enfoque es **motivador**: no hay penalización por errores, solo refuerzo positivo, puntos y logros. La mayoría de funciones trabajan **sin internet** (excepto los videos de YouTube).

---

## Cómo funciona

### Primer uso

Al abrir la app por primera vez:

1. Se crea la base de datos local SQLite (`mateappplus.db`).
2. Se cargan videos, evaluaciones, juegos, galerías y un banco de **105 preguntas**.
3. El perfil inicia como **"Aprendiz Matemático"** con 0 puntos.

No hace falta crear cuenta en la nube.

### Módulos

| Módulo | Qué hace | Puntos |
|--------|----------|--------|
| **Videos** | Lecciones embebidas de YouTube; se pueden marcar como favorito | +5 al ver un video |
| **Evaluaciones** | Pruebas de 10 preguntas sin límite de tiempo; feedback y explicación | +10 por acierto |
| **Galería** | Diagramas educativos con zoom (offline) | — |
| **Juegos** | Quiz con temporizador (y juegos externos embebidos) | +15 por acierto |
| **Mi progreso** | Puntos, nivel, estadísticas, logros y actividad reciente | — |
| **Mi perfil** | Cambiar jugador, nueva partida o editar nombre/alias | — |

### Gamificación

- **Nivel**: sube cada 100 puntos.  
- **Logros**: se desbloquean al alcanzar umbrales (50, 200, 500, 1000, 2000 pts).  
- Solo se **ganan** puntos; no se pierden al fallar.

### Flujo típico

```
Inicio → elige módulo → interactúa (video / pregunta / imagen / juego)
       → se valida y guarda en SQLite → se suman puntos / logros
       → se muestra en Progreso y actividad reciente
```

---

## Cómo está desarrollada

### Stack

| Capa | Tecnología |
|------|------------|
| Framework | **.NET 9 MAUI Blazor Hybrid** |
| UI | Componentes **Razor** + CSS (estilo infantil / educativo) |
| Persistencia | **SQLite** + **Entity Framework Core 9** |
| Animaciones / helpers | **CommunityToolkit.Maui 11** |
| Plataformas | Android 24+, iOS 15+, Mac Catalyst 15+, Windows 10+ |

La app se llama **MateAppPlus** (`ApplicationId`: `com.ipa.proporciones`, versión **1.5**).

### Arquitectura

Proyecto único (`MauiApp2`) organizado por capas:

```
AppMovilMatematicas/
├── Components/     # UI Blazor (páginas, layout, controles compartidos)
├── Models/         # Entidades y enums
├── Data/           # DbContext, bootstrap, seed de contenido
├── Services/       # Lógica de negocio e interfaces (DI)
├── Constants/      # Mensajes de refuerzo positivo
├── Platforms/      # Código específico (Android, iOS, Windows…)
├── wwwroot/        # CSS, assets web, datos JSON
└── docs/           # Manual de usuario y documentación técnica
```

**Patrón:** la UI (Razor) consume servicios registrados en DI (`MauiProgram.cs`). Esos servicios usan `AppDbContext` para leer/escribir progreso, resultados y contenido.

### Capas principales

1. **Presentación** (`Components/Pages/...`)  
   Rutas Blazor: inicio, videos, evaluaciones, galería, juegos, progreso y perfil.

2. **Servicios** (`Services/`)  
   `IVideoService`, `IEvaluacionService`, `IGaleriaService`, `IJuegoService`, `IUsuarioService`, `IProgresoService`, etc. Exponen DTOs a la UI.

3. **Datos** (`Data/`)  
   - Inicialización al arranque (`DatabaseBootstrap` / `DatabaseInitializer`).  
   - Seed idempotente: preguntas, videos, evaluaciones, juegos, galerías y logros.  
   - BD en `FileSystem.AppDataDirectory/mateappplus.db`.

### Rutas Blazor

| Ruta | Pantalla |
|------|----------|
| `/` | Inicio |
| `/videos`, `/videos/{id}` | Lista y detalle de video |
| `/evaluaciones`, `/evaluaciones/{id}` | Lista y evaluación |
| `/galeria`, `/galeria/{id}` | Lista y detalle de galería |
| `/juegos`, `/juegos/{id}` | Lista y partida |
| `/progreso` | Progreso y logros |
| `/perfil` | Perfiles / nueva partida |

---

## Requisitos

- [.NET 9 SDK](https://dotnet.microsoft.com/download)
- Visual Studio 2022/2026 con workload **.NET Multi-platform App UI** (o `dotnet` CLI)
- Para Android: SDK / emulador o dispositivo USB
- Para Windows: destino *Windows Machine*

---

## Cómo ejecutar

Desde la raíz del repositorio:

```bash
# Windows
dotnet build MauiApp2.csproj -f net9.0-windows10.0.19041.0
dotnet run --project MauiApp2.csproj -f net9.0-windows10.0.19041.0

# Android
dotnet build MauiApp2.csproj -f net9.0-android
```

En Visual Studio: abrir `MauiApp2.sln`, elegir el destino (Windows Machine o Android) y pulsar **Ejecutar** (F5).

### Generar APK (Android)

1. Configuración **Release**, target `net9.0-android`.  
2. **Build → Archive → Distribute → APK**.

> En Android Release el proyecto desactiva el recorte agresivo de EF Core/SQLite (`PublishTrimmed=false`) para evitar fallos en runtime.

---

## Documentación adicional

- [Manual de usuario](docs/manual-usuario.md) — instalación y uso de cada módulo  
- [Documentación técnica](docs/documentacion-tecnica.md) — BD, DI, rutas y build  

---

## Resumen

MateAppPlus es una app **MAUI Blazor Hybrid** offline-first que combina contenido educativo de matemáticas con evaluaciones, juegos y progreso gamificado, persistido en **SQLite** en el dispositivo.
