# Cargar librerías
library(tidyverse)
library(leaflet)
library(leafem)
library(leafpop)

load("C:/Users/PC ONE/R/Estaciones/estaciones_mapa.RData")

locMarker <- makeIcon(
  iconUrl = "C:\\Users\\PC ONE\\Desktop\\Datos práctica integradora Vol. II\\20150203194453red_pin.png",
  iconWidth = 25,
  iconHeight = 41
)

leaflet(estaciones) %>%
  setView(lat = 10.461774, lng = -66.884775, zoom = 12) %>%
  addMarkers(
    lat = ~Latitud,
    lng = ~Longitud,
    label = ~paste(`Estación`,'(',Altitud,' m)'),
    labelOptions = labelOptions(style = list('font-size' = '16px'), noHide = T, direction = 'right'),
    popup = ~paste('<p style="font-size:16px;"><b style="color:red;">Temperaturas (°C)</b> y <b style="color:blue;">precipitación</b></p>',
                   '<b>Enero:</b> ','<em style="color:red;">',`Enero T`,'</em>,','<em style="color:blue;">',`Enero P`,'</em>',
                   '<br><b>Febrero:</b> ','<em style="color:red;">',`Febrero T`,'</em>,','<em style="color:blue;">',`Febrero P`,'</em>',
                   '<br><b>Marzo:</b> ','<em style="color:red;">',`Marzo T`,'</em>,','<em style="color:blue;">',`Marzo P`,'</em>',
                   '<br><b>Abril:</b> ','<em style="color:red;">',`Abril T`,'</em>,','<em style="color:blue;">',`Abril P`,'</em>',
                   '<br><b>Mayo:</b> ','<em style="color:red;">',`Mayo T`,'</em>,','<em style="color:blue;">',`Mayo P`,'</em>',
                   '<br><b>Junio:</b> ','<em style="color:red;">',`Junio T`,'</em>,','<em style="color:blue;">',`Junio P`,'</em>',
                   '<br><b>Julio:</b> ','<em style="color:red;">',`Julio T`,'</em>,','<em style="color:blue;">',`Julio P`,'</em>',
                   '<br><b>Agosto:</b> ','<em style="color:red;">',`Agosto T`,'</em>,','<em style="color:blue;">',`Agosto P`,'</em>',
                   '<br><b>Septiembre:</b> ','<em style="color:red;">',`Septiembre T`,'</em>,','<em style="color:blue;">',`Septiembre P`,'</em>',
                   '<br><b>Octubre:</b> ','<em style="color:red;">',`Octubre T`,'</em>,','<em style="color:blue;">',`Octubre P`,'</em>',
                   '<br><b>Noviembre:</b> ','<em style="color:red;">',`Noviembre T`,'</em>,','<em style="color:blue;">',`Noviembre P`,'</em>',
                   '<br><b>Diciembre:</b> ','<em style="color:red;">',`Diciembre T`,'</em>,','<em style="color:blue;">',`Diciembre P`,'</em>',
                   '<br><br><em>Grieser, J., Gommes, R. y Bernardi, M. 2006. New LocClim-the local climate estimartor of FAO. Geophys. Res. Abstr., <b>8(8305):</b> 2.</em>'),
    group = 'Estaciones meteorológicas') %>%
  addMarkers(
    data = lugarEstudio,
    lat = ~Latitud,
    lng = ~Longitud,
    label = ~paste(`Estación`,'(',Altitud,' m)'),
    labelOptions = labelOptions(style = list('font-size' = '16px'), noHide = T, direction = 'right'),
    icon = locMarker,
    group = 'Lugar de estudio'
  ) %>%
  addProviderTiles(providers$Esri.WorldImagery, group = 'ESRI World Imagery') %>%
  addProviderTiles(providers$OpenTopoMap, group = 'OpenTopoMap') %>%
  addLayersControl(
    overlayGroups = c('Estaciones meteorológicas','Lugar de estudio'),
    baseGroups = c('Esri World Imagery','OpenTopoMap'),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addScaleBar(position = 'bottomleft') %>%
  addMouseCoordinates()