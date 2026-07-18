using Microsoft.EntityFrameworkCore;
using MauiApp2.Data;
using MauiApp2.Models;

namespace MauiApp2.Services;

public static class UsuarioSesionExtensions
{
    public static async Task<Usuario> ObtenerUsuarioSesionAsync(
        this AppDbContext ctx,
        ISesionService sesion,
        CancellationToken ct = default)
    {
        if (sesion.TieneSesion)
        {
            var actual = await ctx.Usuarios.FindAsync([sesion.UsuarioActualId!.Value], ct);
            if (actual is not null) return actual;
            sesion.CerrarSesion();
        }

        var primero = await ctx.Usuarios.OrderBy(u => u.Id).FirstOrDefaultAsync(ct)
            ?? throw new InvalidOperationException("No hay perfiles creados.");

        sesion.EstablecerUsuario(primero.Id);
        return primero;
    }
}
