var builder = WebApplication.CreateBuilder(args);

// Registro del servicio global


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSession();
// builder.Services.AddControllersWithViews(options =>
// {
//     options.Filters.Add<SessionCheckFilter>();
// });
builder.Services.AddSingleton<Chaskifud.Services.GlobalVariableService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}   

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseSession();  

app.UseRouting();


app.UseAuthorization();


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();