FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /uyg


COPY . /uyg

RUN dotnet restore
RUN dotnet publish -c Release -o p_folder

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /prod_uyg

COPY --from=build /uyg/p_folder /prod_uyg

CMD [ "dotnet","yp-demo.dll" ]