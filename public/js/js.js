document.addEventListener('DOMContentLoaded', function() {
    var isFormVisible = false; // Variable pour suivre l'état du formulaire
    var form = document.getElementById('articleForm');
    var button = document.getElementById('showFormButton');

    button.addEventListener('click', function(event) {
        event.stopPropagation(); // Empêche l'événement de remonter à l'élément body
        if (isFormVisible) {
            // Si le formulaire est visible, le cacher
            form.style.right = '-100%';
            isFormVisible = false;
        } else {
            // Si le formulaire est caché, le montrer
            form.style.right = '0';
            isFormVisible = true;
        }
    });

    // Empêche l'événement click sur le formulaire de remonter à l'élément body
    form.addEventListener('click', function(event) {
        event.stopPropagation();
    });

    // Ferme le formulaire lorsque vous cliquez en dehors de la div du formulaire
    document.body.addEventListener('click', function() {
        if (isFormVisible) {
            form.style.right = '-100%';
            isFormVisible = false;
        }
    });
});