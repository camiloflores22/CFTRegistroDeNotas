using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace CFTRegistroDeNotas.Models;

public partial class DbcftContext : DbContext
{
    public DbcftContext()
    {
    }

    public DbcftContext(DbContextOptions<DbcftContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Asignatura> Asignaturas { get; set; }

    public virtual DbSet<AsignaturasAsignada> AsignaturasAsignadas { get; set; }

    public virtual DbSet<Estudiante> Estudiantes { get; set; }

    public virtual DbSet<Nota> Notas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
  {
        if (!optionsBuilder.IsConfigured) 
        {
        
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8_general_ci")
            .HasCharSet("utf8");

        modelBuilder.Entity<Asignatura>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("asignaturas");

            entity.Property(e => e.Id)
                .HasColumnType("int(11)")
                .HasColumnName("ID");
            entity.Property(e => e.Codigo).HasMaxLength(45);
            entity.Property(e => e.Descripcion).HasMaxLength(45);
            entity.Property(e => e.Nombre).HasMaxLength(45);
        });

        modelBuilder.Entity<AsignaturasAsignada>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("asignaturas_asignadas");

            entity.HasIndex(e => e.AsignaturasId, "fk_Estudiantes_has_Asignaturas_Asignaturas1_idx");

            entity.HasIndex(e => e.EstudiantesId, "fk_Estudiantes_has_Asignaturas_Estudiantes_idx");

            entity.Property(e => e.Id)
                .HasColumnType("int(11)")
                .HasColumnName("ID");
            entity.Property(e => e.AsignaturasId)
                .HasColumnType("int(11)")
                .HasColumnName("AsignaturasID");
            entity.Property(e => e.EstudiantesId)
                .HasColumnType("int(11)")
                .HasColumnName("EstudiantesID");

            entity.HasOne(d => d.Asignaturas).WithMany(p => p.AsignaturasAsignada)
                .HasForeignKey(d => d.AsignaturasId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Estudiantes_has_Asignaturas_Asignaturas1");

            entity.HasOne(d => d.Estudiantes).WithMany(p => p.AsignaturasAsignada)
                .HasForeignKey(d => d.EstudiantesId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Estudiantes_has_Asignaturas_Estudiantes");
        });

        modelBuilder.Entity<Estudiante>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("estudiantes");

            entity.Property(e => e.Id)
                .HasColumnType("int(11)")
                .HasColumnName("ID");
            entity.Property(e => e.Apellido).HasMaxLength(45);
            entity.Property(e => e.Direccion).HasMaxLength(45);
            entity.Property(e => e.Edad).HasColumnType("int(11)");
            entity.Property(e => e.Email).HasMaxLength(45);
            entity.Property(e => e.Nombre).HasMaxLength(45);
            entity.Property(e => e.Password).HasMaxLength(45);
            entity.Property(e => e.Rut).HasMaxLength(45);
        });

        modelBuilder.Entity<Nota>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("notas");

            entity.HasIndex(e => e.AsignaturasId, "fk_Notas_Asignaturas1_idx");

            entity.HasIndex(e => e.EstudiantesId, "fk_Notas_Estudiantes1_idx");

            entity.Property(e => e.Id)
                .HasColumnType("int(11)")
                .HasColumnName("ID");
            entity.Property(e => e.AsignaturasId)
                .HasColumnType("int(11)")
                .HasColumnName("AsignaturasID");
            entity.Property(e => e.EstudiantesId)
                .HasColumnType("int(11)")
                .HasColumnName("EstudiantesID");
            entity.Property(e => e.Nota1).HasColumnName("Nota");

            entity.HasOne(d => d.Asignaturas).WithMany(p => p.Nota)
                .HasForeignKey(d => d.AsignaturasId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Notas_Asignaturas1");

            entity.HasOne(d => d.Estudiantes).WithMany(p => p.Nota)
                .HasForeignKey(d => d.EstudiantesId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Notas_Estudiantes1");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
