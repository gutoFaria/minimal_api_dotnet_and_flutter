﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using backend.Data;

#nullable disable

namespace backend.Migrations
{
    [DbContext(typeof(WorkDbContext))]
    partial class WorkDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.1");

            modelBuilder.Entity("backend.Models.Work", b =>
                {
                    b.Property<int>("WorkId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<DateTime>("AddedTime")
                        .HasColumnType("TEXT");

                    b.Property<int>("AdvancedPrice")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Category")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<int>("InitialPrice")
                        .HasColumnType("INTEGER");

                    b.Property<int>("IntermediatePrice")
                        .HasColumnType("INTEGER");

                    b.Property<string>("WorkName")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("WorkId");

                    b.ToTable("Works");
                });
#pragma warning restore 612, 618
        }
    }
}
