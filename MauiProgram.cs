using CommunityToolkit.Maui;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MauiApp2.Data;
using MauiApp2.Data.Seed;
using MauiApp2.Services;

namespace MauiApp2;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseMauiCommunityToolkit()
            .ConfigureFonts(fonts => fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular"));

        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "mateappplus.db");
        builder.Services.AddDbContext<AppDbContext>(o =>
            o.UseSqlite($"Data Source={dbPath}", sqlite =>
                sqlite.UseQuerySplittingBehavior(QuerySplittingBehavior.SplitQuery)));
        builder.Services.AddSingleton<IPreguntasJsonLoader, PreguntasJsonLoader>();
        builder.Services.AddSingleton<ISesionService, SesionService>();
        builder.Services.AddSingleton<INavegacionUiService, NavegacionUiService>();
        builder.Services.AddSingleton<IFullscreenUiService, FullscreenUiService>();
        builder.Services.AddSingleton<IOrientationService, OrientationService>();
        builder.Services.AddScoped<IVideoService, VideoService>();
        builder.Services.AddScoped<IEvaluacionService, EvaluacionService>();
        builder.Services.AddScoped<IGaleriaService, GaleriaService>();
        builder.Services.AddScoped<IJuegoService, JuegoService>();
        builder.Services.AddScoped<IUsuarioService, UsuarioService>();
        builder.Services.AddScoped<IProgresoService, ProgresoService>();
        builder.Services.AddScoped<IPreguntaValidationService, PreguntaValidationService>();
        builder.Services.AddScoped<IDatabaseInitializer, DatabaseInitializer>();
        builder.Services.AddMauiBlazorWebView();

#if DEBUG
        builder.Services.AddBlazorWebViewDeveloperTools();
        builder.Logging.AddDebug();
#endif

        var app = builder.Build();
        DatabaseBootstrap.Inicializar(app.Services);

        return app;
    }
}
