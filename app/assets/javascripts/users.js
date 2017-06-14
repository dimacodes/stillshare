// class User{
//   constructor(json) {
//     this.id = json.user.id;
//     this.name = responseObject.name;
//     this.email = responseObject.email;
//     this.events = responseObject.events;
//   }
// }
// ^ Rememeber to instantiate new Object

function getEvents() {
  $.ajax({
    method: "get",
    url: "http://localhost:3000/" + getRoute() + ".json",
    error: function(data) {
      $(".all_events").empty().append("Please try again.")
    },
    success: function(data) {

      data.user.events.forEach(function(event) {
        // debugger
        var id = event.id;
        var userId = event.user_id;
        var eventLink = $(document.createElement("a"));
        eventLink.attr('href', "http://localhost:3000/users/" + parseInt(userId) + "/events/" + parseInt(id))
        eventLink.text(event.title)
        $(".all_events").append(eventLink).append("<br>")
      })
    }
  })
}

// fix below to dyna route, display images
// function showEvent(e) {
//   $("a.all_events").on("click", function(e) {
//     e.preventDefault();
//     $.ajax({
//       method: "get",
//       url: "http://localhost:3000/users/7/events/6" + ".json",
//       error: function(data) {
//         $("#get_message").empty().append("Please try again.")
//       },
//       success: function(data) {
//         var event = data.event;
//           // debugger
//           var id = event.id;
//           var title = event.title;
//           var userId = event.user_id;
//           var eventLink = $(document.createElement("a"))
//           var imageList = event.images
//           imageList.forEach(function(image) {
//             var title = image.title
//
//
//             var imageLink = $(document.createElement("li"));
//             // eventLink.attr('href', "http://localhost:3000/users/" + parseInt(userId) + "/events/" + parseInt(id))
//             imageLink.text(image.title)
//             $(".event").append(imageLink).append("<br>")
//           })
//         }
//       })
//     })
//   }


function getRoute() {
  return window.location.href.toString().split(window.location.host)[1];
}


// Another anonymous practice get function
$(function() {
  $(".all_events").on("click", function(e) {

    e.preventDefault();
    $.get("http://localhost:3000/users/7/events/6" + getRoute() + ".json", function(data) {
      var event = data.event;
      var id = event.id;
      var imageList = event.images
      $(".event").empty();
      imageList.forEach(function(image) {
        var title = image.title
        var imageId = image.id
        var imageLink = $(document.createElement("a"));
        imageLink.attr('href', "http://localhost:3000/events/" + parseInt(id) + "/images/" + parseInt(imageId))
        imageLink.text(image.title)
        $(".event").append(imageLink).append("<br>")
      })
    })
  })
})

// First anonymous practice get function
// $(function() {
//   $('a.view_events').on('click', function(e) {
//     e.preventDefault();
//     $.ajax({
//       method: "get",
//       url: this.href
//     }).done(function(json) {
//       $('div.events').html(json);
//     })
//   })
// })

$( document ).on('turbolinks:load', () => {
    getEvents();
    // showEvent();
})
