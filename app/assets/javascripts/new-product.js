$(document).on('turbolinks:load', ()=> {
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')

  $('#img-file').change(function(){
    var files = $('input[type="file"]').prop('files')[0];

    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      file_field.files = dataBox.files
      var num = $('.product-image').length + 1 + i
      fileReader.readAsDataURL(file);

      if (num == 5){
        $('#image-box__container').css('display', 'none')
      }

      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='product-image' data-image="${file.name}">
                    <div class=' product-image__content'>
                      <div class='product-image__content--icon'>
                        <img src=${src} width="113 height="113" >
                      </div>
                    </div>
                    <div class='product-image__operetion'>
                      <div class='product-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
        $('#image-box__container').before(html);
      };

      $('#image-box__container').attr('class', `product-num-${num}`)
    });
  });

  $(document).on("click", '.product-image__operetion--delete', function(){
    var target_image = $(this).parent().parent()
    var target_name = $(target_image).data('image')

    if(file_field.files.length==1){
      $('input[type=file]').val(null)
      dataBox.clearData();
    }else{
      $.each(file_field.files, function(i,input){
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      file_field.files = dataBox.files
    }

    target_image.remove()
    var num = $('.product-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `product-num-${num}`)
  })

  function calcTotal(){
    var result = 0.1 * $('#product_price').val();
    var total = parseInt(result);
    $('#commentSecond__score').text("¥" + total);
    var total2 = $('#product_price').val() - total;
    $('.content__commentSecond__score').text("¥" + total2);
  }

  $(function() {
    $('input[type="number"]').on('keyup change', function() {
      calcTotal();
    });
  });
});