var Contact = function () {

    return {

        //Map
        initMap: function (argumentaddress) {
            var map;
            $(document).ready(function(){

                map = new GMaps({
                    div: '#map',
                    lat: -12.043333,
                    lng: -77.028333
                });

                GMaps.geocode({
                    address: String(argumentaddress),
                    callback: function(results, status){
                        if(status=='OK'){
                            var latlng = results[0].geometry.location;
                            map.setCenter(latlng.lat(), latlng.lng());
                            map.addMarker({
                                lat: latlng.lat(),
                                lng: latlng.lng()
                            });
                        }
                    }
                });

            });
        }
    };
}();