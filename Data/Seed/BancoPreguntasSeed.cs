using MauiApp2.Models;

namespace MauiApp2.Data.Seed;

public record PreguntaSeed(string Enunciado, string Explicacion, TemaMatematico Tema, string[] Opciones, int IndiceCorrecta);

public static class BancoPreguntasSeed
{
    public static List<PreguntaSeed> GenerarTodas()
    {
        var lista = new List<PreguntaSeed>();
        lista.AddRange(GenerarProporcionalidadDirecta());
        lista.AddRange(GenerarProporcionalidadInversa());
        lista.AddRange(GenerarRazones());
        lista.AddRange(GenerarReglaDeTres());
        lista.AddRange(GenerarPorcentajes());
        lista.AddRange(GenerarFacturasIva());
        lista.AddRange(GenerarInteresSimple());
        return lista;
    }

    private static IEnumerable<PreguntaSeed> GenerarProporcionalidadDirecta()
    {
        yield return P("¿Qué es proporcionalidad directa?", "Cuando dos magnitudes crecen o decrecen en la misma razón.", TemaMatematico.ProporcionalidadDirecta,
            ["Dos magnitudes en razón inversa", "Dos magnitudes en la misma razón", "Magnitudes sin relación", "Solo aplica en geometría"], 1);
        for (var i = 1; i <= 14; i++)
        {
            var a = i + 2; var b = a * 2; var c = a + 3; var resp = c * 2;
            yield return P($"Si {a} lápices cuestan ${b}, ¿cuánto cuestan {c} lápices?", $"({c}×{b})÷{a}={resp}.", TemaMatematico.ProporcionalidadDirecta, Nums(resp, resp + 4, resp - 3, resp + 8), 0);
        }
    }

    private static IEnumerable<PreguntaSeed> GenerarProporcionalidadInversa()
    {
        yield return P("En proporcionalidad inversa, si una magnitud aumenta, la otra…", "Varían en sentido contrario.", TemaMatematico.ProporcionalidadInversa,
            ["Aumenta igual", "Disminuye", "Se mantiene", "Se duplica"], 1);
        for (var i = 1; i <= 14; i++)
        {
            var obr = i + 1; var dias = 12; var nuevos = obr + 2; var resp = (obr * dias) / nuevos;
            yield return P($"Si {obr} obreros terminan en {dias} días, ¿cuántos días tardan {nuevos} obreros?", $"k={obr * dias}, días={resp}.", TemaMatematico.ProporcionalidadInversa, Nums(resp, resp + 3, resp - 2, resp + 6), 0);
        }
    }

    private static IEnumerable<PreguntaSeed> GenerarRazones()
    {
        yield return P("La razón 8:12 simplificada es:", "8/12=2/3.", TemaMatematico.Razones, ["2:3", "3:2", "4:6", "8:12"], 0);
        for (var i = 1; i <= 14; i++)
            yield return P($"Simplifica {i * 2}:{i * 3}.", $"Dividimos por {i}.", TemaMatematico.Razones, ["2:3", $"{i * 2}:{i * 3}", "3:2", "1:2"], 0);
    }

    private static IEnumerable<PreguntaSeed> GenerarReglaDeTres()
    {
        yield return P("La regla de tres se usa para:", "Encontrar un valor desconocido en proporción.", TemaMatematico.ReglaDeTres, ["Resolver proporciones", "Calcular áreas", "Sumar fracciones", "Medir ángulos"], 0);
        for (var i = 1; i <= 14; i++)
        {
            var kg = i + 1; var precio = kg * 5; var kg2 = kg + 4; var resp = kg2 * 5;
            yield return P($"Si {kg} kg cuestan ${precio}, ¿cuánto cuestan {kg2} kg?", $"({kg2}×{precio})÷{kg}={resp}.", TemaMatematico.ReglaDeTres, Nums(resp, resp + 5, resp - 4, resp + 10), 0);
        }
    }

    private static IEnumerable<PreguntaSeed> GenerarPorcentajes()
    {
        yield return P("El 50% de un número es:", "50%=la mitad.", TemaMatematico.Porcentajes, ["La mitad", "El doble", "Un tercio", "El total"], 0);
        for (var i = 1; i <= 14; i++)
        {
            var num = i * 20; var pct = 10 + i; var resp = num * pct / 100;
            yield return P($"Calcula el {pct}% de {num}.", $"{num}×{pct}/100={resp}.", TemaMatematico.Porcentajes, Nums(resp, resp + 5, resp - 3, resp + 12), 0);
        }
    }

    private static IEnumerable<PreguntaSeed> GenerarFacturasIva()
    {
        yield return P("El IVA del 19% es:", "Impuesto sobre el subtotal.", TemaMatematico.FacturasIva, ["Impuesto del 19% sobre subtotal", "Descuento 19%", "19% del total final", "Cargo fijo $19"], 0);
        for (var i = 1; i <= 14; i++)
        {
            var sub = i * 100; var iva = sub * 19 / 100; var total = sub + iva;
            yield return P($"Subtotal ${sub}. ¿Total con IVA 19%?", $"IVA={iva}, total={total}.", TemaMatematico.FacturasIva, Nums(total, sub, iva, total + 50), 0);
        }
    }

    private static IEnumerable<PreguntaSeed> GenerarInteresSimple()
    {
        yield return P("En I=P×r×t, t está en:", "Misma unidad que la tasa anual.", TemaMatematico.InteresSimple, ["Años (tasa anual)", "Días siempre", "Meses siempre", "Semanas"], 0);
        for (var i = 1; i <= 14; i++)
        {
            var p = i * 500; var r = 4 + i; var t = 2; var interes = p * r * t / 100;
            yield return P($"¿Interés de ${p} al {r}% anual por {t} años?", $"I={p}×{r}×{t}/100={interes}.", TemaMatematico.InteresSimple, Nums(interes, interes + 20, interes - 15, interes + 40), 0);
        }
    }

    private static PreguntaSeed P(string e, string x, TemaMatematico t, string[] o, int c) => new(e, x, t, o, c);
    private static string[] Nums(int a, int b, int c, int d) => [a.ToString(), b.ToString(), c.ToString(), d.ToString()];
}
