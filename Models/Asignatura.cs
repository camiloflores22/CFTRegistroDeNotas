using System;
using System.Collections.Generic;

namespace CFTRegistroDeNotas.Models;

public partial class Asignatura
{
    public int Id { get; set; }

    public string Nombre { get; set; } = null!;

    public string Descripcion { get; set; } = null!;

    public string Codigo { get; set; } = null!;

    public DateOnly? FechaCreacion { get; set; }

    public virtual ICollection<AsignaturasAsignada> AsignaturasAsignada { get; set; } = new List<AsignaturasAsignada>();

    public virtual ICollection<Nota> Nota { get; set; } = new List<Nota>();
}
