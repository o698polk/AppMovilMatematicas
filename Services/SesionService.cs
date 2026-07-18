namespace MauiApp2.Services;

/// <summary>
/// Guarda el ID del perfil activo en preferencias locales (sin contraseña).
/// </summary>
public interface ISesionService
{
    int? UsuarioActualId { get; }
    bool TieneSesion { get; }
    void EstablecerUsuario(int usuarioId);
    void CerrarSesion();
}

public class SesionService : ISesionService
{
    private const string Key = "usuario_actual_id";

    public int? UsuarioActualId
    {
        get
        {
            if (!Preferences.ContainsKey(Key)) return null;
            var id = Preferences.Get(Key, 0);
            return id > 0 ? id : null;
        }
    }

    public bool TieneSesion => UsuarioActualId is > 0;

    public void EstablecerUsuario(int usuarioId) => Preferences.Set(Key, usuarioId);

    public void CerrarSesion()
    {
        if (Preferences.ContainsKey(Key))
            Preferences.Remove(Key);
    }
}
