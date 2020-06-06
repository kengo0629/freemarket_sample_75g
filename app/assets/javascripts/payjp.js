$(document).on('turbolinks:load',function(){
  console.log(1)
  Payjp.setPublicKey('pk_test_d9ef8a1f3d92c4b34e10ca30');
  var form = $(".form");
  $("#charge-form").click(function() {
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };
    Payjp.createToken(card, function(status, response) {
      if (response.error){
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }   
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        var token = response.id;
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      };
    });
  });
});
