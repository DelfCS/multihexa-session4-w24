// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function toggleDiscussionText(msgId) {
    var text = document.getElementById("text" + msgId)
    var button = document.getElementById('button' +msgId)
    if (text.style.display === 'none') {
        text.style.display = 'block';
        button.innerHTML = "hide";
    } else {
        text.style.display = 'none';
        button.innerHTML = "view";
    }
    Alert("This is an alert");
}


