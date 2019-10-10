// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


//send ajax request to back-end and adding results to "results div"
$(function() {
    $('#search').on('click', function() {
        var text = $('#inp').val();
        if (text.length > 0) {
            $('#results').empty()
            send_ajax(text)
        } else {
            alert("Input field cant be empty!")
        }
    })
});

function add_html(response) {
    response.data.forEach(element => {
        $('#results').append("<div class='result'>Name: " + element['Name'] +
            "; Type: " + element['Type'] +
            "; Designed by: " + element['Designed by'] +
            ".</div>"
        );
    })
}

function send_ajax(text) {
    $.ajax({
        url: '/search',
        data: {
            text: text
        },
        dataType: 'json',
        success: function(response) {
            if (response.data.length == 0) {
                $('#results').html("<div class='result'>Not Found!</div>")
            } else {
                add_html(response)
            }
        }
    });
}