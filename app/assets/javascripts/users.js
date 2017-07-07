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
      eventId = event.id;
      var userId = event.user_id;
      var eventLink = $(document.createElement("a"));
      eventLink.attr('href', "http://localhost:3000/users/" + parseInt(userId) + "/events/" + parseInt(eventId))
      eventLink.text(event.title)
      $(".all_events").append(eventLink).append("<br>")
      })
    }
  })
}

function showEvent(e) {
  $(".all_events").on("click", function(e) {
    e.preventDefault();
    var eventId = e.target.href.split('/').splice(3,7)[3]
    $.ajax({
      method: "get",
      url: "http://localhost:3000/" + getRoute() + "/events/" + parseInt(eventId) + ".json",
      error: function(data) {
        $("#get_message").empty().append("Please try again.")
      },
      success: function(data) {
        
        var event = data.event;
        var eventId = event.id;
        var eventTitle = event.title;
        var userId = event.user_id;
        var eventLink = $(document.createElement("a"))
        var imageList = event.images
        $(".event").empty();

        imageList.forEach(function(image) {
          var imageTitle = image.title
          var imageId = image.id
          var imageLink = $(document.createElement("a"));
          imageLink.attr('href', "http://localhost:3000/events/" + parseInt(eventId) + "/images/" + parseInt(imageId))
          imageLink.text(image.title)
          $(".event").append(imageLink).append("<br>")
        })
      }
    })
  })
}


function getRoute() {
  return window.location.href.toString().split(window.location.host)[1];
}

$( document ).on('turbolinks:load', () => {
    getEvents();
    showEvent();
})
