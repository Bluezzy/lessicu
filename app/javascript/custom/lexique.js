import $ from 'jquery'

$(document).ready(function () {
    $('.letter').click(function (e) {
        e.preventDefault();
        var query = $(this).text();
        $.ajax({
            url: "/search?query=" + query,
            method: "get",
        }).done(function (data) {
            emptyQueryResults();
            displayData(data);
        }).fail(function (data) {
            debugger;
            alert('something went wront with the request');
        });
    });
});

function displayData(data) {
    for (var i = 0; i < data.length; i++) {
        var word = data[i];
        $('#query_results').append(generateSpan(word));
        $('#query_results').append('<br></br>');
    }
}

function generateSpan(word) {
    return "<span>" + word.name + "</span>      <span>" + word.translation + "</span>"
}

function emptyQueryResults() {
    $('#query_results').empty();
}