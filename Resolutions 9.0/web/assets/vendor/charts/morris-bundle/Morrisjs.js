var datos = null;

(function(window, document, $, undefined) {
    "use strict";
    $(function() {
        
        
        
        $.ajax({
            method: "POST",
            url: "/Resolutions_9.0/EquipoControlador",
            data: { opcion: 6 }
          })
            .done(function( msg ) {
              datos = msg.split("#");
              generateChart();
        });
        
        
    });
    

})(window, document, window.jQuery);


function generateChart(){
    
    
        if ($('#morris_donut').length) {
            Morris.Donut({
                element: 'morris_donut',
                data: [
                    { value: Number(datos[0]), label: 'Reparado' },
                    { value: Number(datos[1]), label: 'En reparación' },
                    { value: Number(datos[2]), label: 'Por reparar' }
                ],
             
                labelColor: '#2e2f39',
                   gridTextSize: '14px',
                colors: [
                     "#5969ff",
                                "#ff407b",
                                "#25d5f2",
                                "#ffc750"
                               
                ],

                formatter: function(x) { return x + " Equipo(s)" },
                  resize: true
            });
        }
    
}