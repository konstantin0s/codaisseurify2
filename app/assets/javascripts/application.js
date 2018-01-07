// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .


var pathname = window.location.pathname;

function createSong(title) {

  $.ajax({
    type: "POST",
    url:  "/api" + pathname + "/songs.json",
    data: JSON.stringify({
      name: title
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
  console.log(data)

  var deleteId = "song-" + data.song.id;

  var tableRow = $("<tr></tr>");
  tableRow.addClass("song");
  tableRow.attr('song-id', data.song.id);

  var tableData = $("<td></td>");

  var deleteLink= $('<a></a>');
  deleteLink.attr('href', '#');
  deleteLink.attr('id', deleteId);
  deleteLink.attr('class', "delete-song");
  deleteLink.bind('click', deleteSong);

  var deleteIcon = $('<span></span>')
  deleteIcon.attr('class', "glyphicon glyphicon-remove");

  var label = $('<label></label>');
  label.attr('for', deleteId);
  label.html(data.song.name);

  deleteLink.append(deleteIcon);

  tableData.append(deleteLink);
  tableData.append(label);

  tableRow.append(tableData);

  $("#song-list").find('tbody').append( tableRow );

  })
  .fail(function(error) {
    console.log(error);
    // error_message = error.responseText;
    // showError(error_message);
  })
}

// function showError(message) {
//   $("#songinput").addClass("error");
//   var errorElement = $("<small></small>")
//     .attr("id", "error_message")
//     .addClass("error")
//     .html(message);
//   $(errorElement).appendTo('form .field');
// }

// function resetErrors() {
//   $("#error_message").remove();
//   $("#songinput").removeClass("error");
// }

function submitSong(event) {
  event.preventDefault();
  // resetErrors();
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

function deleteSong(event) {
  event.preventDefault();
  var listItem = $(this).parent().parent();
  var songId = $(listItem).data('id');
  $.ajax({
    type: "DELETE",
    url: "/api" + pathname + "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"})
  .done(function(data) {
    listItem.remove();
  });
}

function deleteAllSongs(event) {
  event.preventDefault();
  $(".delete-song").trigger( "click" );
}

$(document).ready(function() {
  $("form").bind('submit', submitSong);
  $(".delete-song").bind('click', deleteSong);
  $(".delete-all-songs").bind('click', deleteAllSongs);
});
