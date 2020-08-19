function CalculaDistancia() {
                $('#litResultado').html('Aguarde...');
                var service = new google.maps.DistanceMatrixService();
             
                service.getDistanceMatrix(
                  {
                     
                      origins: [$("#txtOrigem").val()],
                    
                      destinations: [$("#txtDestino").val()],
                    
                      travelMode: google.maps.TravelMode.DRIVING,
                    
                      unitSystem: google.maps.UnitSystem.METRIC
                  
                  }, callback);
            }
            
            function callback(response, status) {
              
                if (status != google.maps.DistanceMatrixStatus.OK)
                   
                    $('#litResultado').html(status);
                else {
                    
                    $('#litResultado').html("<strong>Origem</strong>: " + response.originAddresses +
                        "<br /><strong>Destino:</strong> " + response.destinationAddresses +
                        "<br /><strong>Distância</strong>: " + response.rows[0].elements[0].distance.text +
                        " <br /><strong>Duração</strong>: " + response.rows[0].elements[0].duration.text
                        );
                    //Atualizar o mapa
                    $("#map").attr("src", "https://maps.google.com/maps?saddr=" + response.originAddresses + "&daddr=" + response.destinationAddresses + "&output=embed");
                }
            }