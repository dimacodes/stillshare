$(function() {
  $('a.load_events').on('click', function(e){
    e.preventDefault();
    $.ajax({
      method: "get",
      url: this.href
    }).done(function(data) {
      $('div.events').html(data);
    })
  })
})
