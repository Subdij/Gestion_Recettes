document.addEventListener('DOMContentLoaded', function() {
    var isFormVisible = false;
    var form = document.getElementById('articleForm');
    var button = document.getElementById('showFormButton');

    button.addEventListener('click', function(event) {
        event.stopPropagation();
        if (isFormVisible) {
            form.style.right = '-100%';
            isFormVisible = false;
        } else {
            form.style.right = '0';
            isFormVisible = true;
        }
    });

    form.addEventListener('click', function(event) {
        event.stopPropagation();
    });

    document.body.addEventListener('click', function() {
        if (isFormVisible) {
            form.style.right = '-100%';
            isFormVisible = false;
        }
    });
});

window.addEventListener('load', function() {
    const loader = document.getElementById('loading-screen');
    setTimeout(function() {
        loader.style.opacity = '0';
        setTimeout(function() {
            loader.style.display = 'none';
        }, 1000);
    }, 1000);
});