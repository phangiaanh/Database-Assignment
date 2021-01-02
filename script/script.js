
var temp;
var Enterprise;

function closeSpan() {
    document.getElementById("myModal").style.display = "none";
}


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
                let img = document.createElement('IMG')
                img.setAttribute("src", temp[i].Enterprise_Avatar)
                img.setAttribute("width", 200)
                img.setAttribute("height", 150)
                text.innerHTML = temp[i].Enterprise_Name
                item.appendChild(text)
                item.appendChild(img)
                button.appendChild(item)
                document.getElementById("Enterprises Framework").appendChild(button)
            
                button.onclick = () => {
                    document.getElementById("myModal").style.display = "block";
                    Enterprise = text.innerHTML
                }
            }
        }    
    })
}

function checkForm(e, text) {
    var code = (e.keyCode ? e.keyCode : e.which)
    if (code == 13) {
        // $.ajax({
        //     url: "localhost:9999/account",
        //     dataType: 'jsonp',
        //     data: {
        //         user: document.getElementById("user").node
        //     }
        // })
        console.log(document.getElementById("user").value)
    }
}