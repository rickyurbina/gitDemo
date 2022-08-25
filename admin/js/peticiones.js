document.getElementById("campo").addEventListener("keyup", getNombres)

function getNombres(){


    let inputNombres = document.getElementById("campo").value
    let lista = document.getElementById("lista")

    let url = "../admin/views/ventaadd.php"
    let formdata = new formdata()
    formdata.append("campo", inputNombres)

    fetch(url, {
        method:"POST",
        body: formdata,
        mode: "cors"
    }).then(response => response.json)
    .then(data =>{
        lista.style.display = 'block'
        lista.innerHTML = data
    })
    .catch(err => console.log(err))
    
}