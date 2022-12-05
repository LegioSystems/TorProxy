FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["LegioSystems.TorProxy/LegioSystems.TorProxy.csproj", "LegioSystems.TorProxy/"]
RUN dotnet restore "LegioSystems.TorProxy/LegioSystems.TorProxy.csproj"
COPY . .
WORKDIR "/src/LegioSystems.TorProxy"
RUN dotnet build "LegioSystems.TorProxy.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "LegioSystems.TorProxy.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "LegioSystems.TorProxy.dll"]
