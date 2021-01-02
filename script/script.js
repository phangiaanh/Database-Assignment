
var temp;
var Enterprise;



function listAllEnterprises() {
    $.ajax({
        url: "http://localhost:9999/something",
        crossDomain: true,
        dataType: 'jsonp',
        jsonp : true,
        success: (res) => {

        },
        error: (err) => {
            var frame = document.getElementById("Enterprises Framework")
            var child = frame.lastElementChild
            while(child) {
                frame.removeChild(child);
                child = frame.lastElementChild;
            }

            for(i=0; i<temp.length; i++) {
                let button = document.createElement('button')
                let item = document.createElement('div')
                item.className = "grid-item"
                let text = document.createElement('h2')
                text.innerHTML = temp[i].Enterprise_Name
                item.appendChild(text)
                button.appendChild(item)
                document.getElementById("Enterprises Framework").appendChild(button)
            
                button.onclick = () => {
                    Enterprise = text.innerHTML
                }
            }
        }    
    })
}