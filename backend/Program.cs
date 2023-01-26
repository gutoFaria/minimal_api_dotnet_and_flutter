using backend.Data;
using backend.Models;
using backend.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<WorkDbContext>(
    opt => opt.UseSqlite(builder.Configuration.GetConnectionString("WorkConnection"))
);

builder.Services.AddScoped<IWorkService, WorkService>();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors();

var app = builder.Build();

app.UseCors(options =>
{
    options.WithOrigins();
    options.AllowAnyMethod();
    options.AllowAnyHeader();
});


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

#region WORK ENDPOINTS
app.MapPost("/creatework", async (Work work, IWorkService req) =>
{
    var res = await req.InsertData(work);
    return Results.Ok(res);
});

app.MapGet("/getwork/{id}", async (int id, IWorkService req) =>
{
    var res = await req.GetDataById(id);
    if (res is null) return Results.NotFound("Work not found");
    return Results.Ok(res);
});

app.MapGet("/getallworks", async (IWorkService req) =>
{
    var res = await req.GetDataAsync();
    return Results.Ok(res);
});

app.MapPut("/updatework", async (Work work, IWorkService req) =>
{
    var res = await req.UpdateData(work);
    if (res is null) return Results.NotFound("Work not found!");
    return Results.Ok(res);
});

app.MapDelete("/deletework/{id}", async (int id, IWorkService req) =>
{
    var res = await req.DeleteData(id);
    if (!res) return Results.BadRequest("Something wrong!");
    return Results.Ok(res);
});
#endregion



app.UseHttpsRedirection();


app.Run();

