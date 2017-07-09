class User {
  constructor(userObject) {
    this.id = userObject.id;
    this.email = userObject.email;
    this.name = userObject.name;
    this.events = userObject.events;
    this.images = userObject.images;
    this.comments = userObject.comments;

  }
}

var userId = window.location.href.toString().split(window.location.host)[1].split('/')[2]
"7";

function getUser(userId) {
  $.ajax({
    url: '/users/' + userId,
    type: 'get',
    dataType: 'json',
    success: function(response) {
      let user = new User(response.user);
      let events = displayEvents(user.events);
    }
  });
}

function displayEvents(events) {
  events.forEach(function(event) {
    eventId = event.id;
    var userId = event.user_id;
    var eventLink = $(document.createElement("a"));
    eventLink.attr('href', "http://localhost:3000/users/" + parseInt(userId) + "/events/" + parseInt(eventId))
    eventLink.text(event.title)
    $(".all_events").append(eventLink).append("<br>")
  })
}

// function getEvents() {
//   $.ajax({
//     method: "get",
//     url: "http://localhost:3000/" + getRoute() + ".json",
//     error: function(response) {
//       $(".all_events").empty().append("Please try again.")
//     },
//     success: function(response) {
//
//       response.user.events.forEach(function(event) {
//         eventId = event.id;
//         var userId = event.user_id;
//         var eventLink = $(document.createElement("a"));
//         eventLink.attr('href', "http://localhost:3000/users/" + parseInt(userId) + "/events/" + parseInt(eventId))
//         eventLink.text(event.title)
//         $(".all_events").append(eventLink).append("<br>")
//       })
//     }
//   })
// }

function showEvent(e) {
  $(".all_events").on("click", function(e) {
    e.preventDefault();
    // debugger
    // var url = e.target.href
    var eventId = e.target.href.split('/').splice(3,7)[3]
    $.ajax({
      method: "get",
      url: "http://localhost:3000/" + getRoute() + "/events/" + parseInt(eventId) + ".json",
      error: function(response) {
        $("#get_message").empty().append("Please try again.")
      },
      success: function(response) {

        var event = response.event;
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

function postComment(e) {
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    // debugger
    $.ajax({
      method: "post",
      url: this.action,
      data: $(this).serialize(),
      error: function(response) {
        $("#get_message").empty().append("Please try again.")
      },
      success: function(response){
        // debugger
        $("#comment_content").val("");
        $(".comments").append(response.comment.user.name + " says:" + response.comment.content);
      }
    })
  })
}

function getRoute() {
  return window.location.href.toString().split(window.location.host)[1];
}

$(document).ready(function() {
  getUser(userId);
  // getEvents();
  showEvent();
  postComment();
})

// $( document ).on('turbolinks:load', () => {
//     getEvents();
//     showEvent();
//     postComment();
// })
