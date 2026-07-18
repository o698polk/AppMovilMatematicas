using Microsoft.EntityFrameworkCore;
using MauiApp2.Models;

namespace MauiApp2.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Usuario> Usuarios => Set<Usuario>();
    public DbSet<Categoria> Categorias => Set<Categoria>();
    public DbSet<VideoEducativo> Videos => Set<VideoEducativo>();
    public DbSet<Evaluacion> Evaluaciones => Set<Evaluacion>();
    public DbSet<Pregunta> Preguntas => Set<Pregunta>();
    public DbSet<OpcionRespuesta> Opciones => Set<OpcionRespuesta>();
    public DbSet<ResultadoEvaluacion> ResultadosEvaluacion => Set<ResultadoEvaluacion>();
    public DbSet<Galeria> Galerias => Set<Galeria>();
    public DbSet<ImagenGaleria> ImagenesGaleria => Set<ImagenGaleria>();
    public DbSet<JuegoEducativo> Juegos => Set<JuegoEducativo>();
    public DbSet<ResultadoJuego> ResultadosJuego => Set<ResultadoJuego>();
    public DbSet<Favorito> Favoritos => Set<Favorito>();
    public DbSet<ProgresoUsuario> Progresos => Set<ProgresoUsuario>();
    public DbSet<Logro> Logros => Set<Logro>();
    public DbSet<LogroUsuario> LogrosUsuario => Set<LogroUsuario>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Pregunta>()
            .HasMany(p => p.Opciones)
            .WithOne(o => o.Pregunta)
            .HasForeignKey(o => o.PreguntaId)
            .OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<Favorito>()
            .HasIndex(f => new { f.UsuarioId, f.TipoEntidad, f.EntidadId })
            .IsUnique();

        modelBuilder.Entity<LogroUsuario>()
            .HasIndex(l => new { l.UsuarioId, l.LogroId })
            .IsUnique();
    }
}
