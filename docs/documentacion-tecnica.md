# Documentación Técnica — Proporciones y Porcentajes

## Stack

| Componente | Tecnología |
|------------|------------|
| Framework | .NET 9 MAUI Blazor Hybrid |
| UI | Razor Components + Bootstrap CSS |
| BD | SQLite + Entity Framework Core 9 |
| Animaciones | CommunityToolkit.Maui 11 |
| Plataformas | Android 24+, iOS 15+, Windows 10+ |

## Arquitectura (proyecto único)

```
MauiApp2/
├── Components/     # Presentation (Razor)
├── Models/         # Entidades y enums
├── Data/           # DbContext, seed, initializer
├── Services/       # Lógica de negocio + DTOs
├── Constants/      # MensajesRefuerzo
└── docs/           # Documentación
```

## Base de datos

- **Ruta:** `FileSystem.AppDataDirectory/proporciones.db`
- **Inicialización:** `DatabaseInitializer` en `MauiProgram.CreateMauiApp()`
- **Estrategia:** `EnsureCreatedAsync()` + seed idempotente

### Tablas principales

`Usuarios`, `Categorias`, `Videos`, `Evaluaciones`, `Preguntas`, `Opciones`, `ResultadosEvaluacion`, `Galerias`, `ImagenesGaleria`, `Juegos`, `ResultadosJuego`, `Favoritos`, `ProgresoUsuario`, `Logros`, `LogrosUsuario`

### Seed

- 105 preguntas (`Data/Seed/BancoPreguntasSeed.cs`)
- 6 videos, 4 evaluaciones, 3 juegos, 3 galerías, 5 logros

## Rutas Blazor

| Ruta | Componente |
|------|------------|
| `/` | Home.razor |
| `/videos` | VideosLista.razor |
| `/videos/{id}` | VideoDetalle.razor |
| `/evaluaciones` | EvaluacionesLista.razor |
| `/evaluaciones/{id}` | EvaluacionJugar.razor |
| `/galeria` | GaleriaLista.razor |
| `/galeria/{id}` | GaleriaDetalle.razor |
| `/juegos` | JuegosLista.razor |
| `/juegos/{id}` | JuegoJugar.razor |
| `/progreso` | Progreso.razor |

## Registro DI (MauiProgram.cs)

```csharp
builder.Services.AddDbContext<AppDbContext>(...);
builder.Services.AddScoped<IVideoService, VideoService>();
// ... demás servicios
```

## Compilar

```bash
# Windows
dotnet build app/MauiApp2/MauiApp2.csproj -f net9.0-windows10.0.19041.0

# Android
dotnet build app/MauiApp2/MauiApp2.csproj -f net9.0-android
```

## Generar APK (Visual Studio)

1. Cambiar configuración a **Release**.
2. Target: **net9.0-android**.
3. **Build → Archive → Distribute → APK**.

## Specs y skills

Documentación de planificación en:
- `/spec` — qué construir
- `/skill` — cómo construirlo
- `/spec/00-progreso.md` — estado de implementación
