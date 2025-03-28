// Gestisce il toggle del menu a tendina su mobile
document.getElementById('menu-toggle').addEventListener('click', function() {
    // Aggiungi o rimuovi la classe 'show' per mostrare o nascondere il menu
    document.getElementById('menu').classList.toggle('show');
});
