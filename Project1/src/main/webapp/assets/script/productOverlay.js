function showProductOverlay(productId) {
    const contextPath = document.getElementById('contextPath').value;
    const xhr = new XMLHttpRequest();
    const url = `${window.location.origin}${contextPath}/servlets/ProductDetailsServlet?id=${productId}`;

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                document.getElementById('product-detail').innerHTML = xhr.responseText;
                document.getElementById('product-overlay-background').style.display = "block";
                document.getElementById('product-overlay').style.display = "flex";
            } else {
                console.error("Errore durante la richiesta AJAX", xhr.statusText);
            }
        }
    };

    xhr.open("GET", url, true);
    xhr.send();
}

function closeProductOverlay() {
    document.getElementById('product-overlay').style.display = "none";
    document.getElementById('product-overlay-background').style.display = "none";
    document.getElementById('product-detail').innerHTML = "";
}
