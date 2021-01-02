function listAllEnterprises(tag) {
    var temp;
    $.ajax({
        type: "GET",
        url: "localhost:9999/something",
        crossDomain: true,
        dataType: 'jsonp',
        jsonp : true,
        error: (err) => {
            console.log(temp)
        }    
    })
}