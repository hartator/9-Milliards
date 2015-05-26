$( document ).ready(function() {
  $( "#newsletter" ).submit(function( event ) {
    event.preventDefault();
    $('#newsletter input[type=submit]').val('Veuillez patienter...')
    $.ajax({
      method: "POST",
      url: "newsletter",
      dataType: 'json',
      data: { email: $('#email-home').val() },
      success: function(data, textstatus, jqxhr){
        $('.jumbotron').html('<h1>Merci! ❤</h1>');
      },
    })
  });
});
