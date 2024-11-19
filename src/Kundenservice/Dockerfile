# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy the .csproj and restore dependencies (via dotnet restore)
COPY Kundenservice.csproj ./
RUN dotnet restore

# Copy the rest of the application and publish it to the /out folder
COPY . ./
RUN dotnet publish -c Release -o /out

# Use the official .NET Runtime image to run the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /out .

# Expose port 80 to allow traffic to the container
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "Kundenservice.dll"]
