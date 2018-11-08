

<div class="content">
           <h2>Самые популярные товары!</h2>
        <div class="flexproduct" id="content">
			 {{CONTENT}}
         </div>
	<input id="show_more" count_show="0" type="button" value="Показать еще"/>
	          {{MORE}}
</div>


<script>
$(document).ready(function(){
         
            $('#show_more').click(function(){
        var btn_more = $(this);
        var count_show = parseInt($(this).attr('count_show'));
        var count_add  = 3;
        btn_more.val('Подождите...');  
				
        $.ajax({
                    url: "/index/", // куда отправляем
                    type: "json", // метод передачи
                    dataType: "text", // тип передачи данных
                    data: { // что отправляем
                        "count_show": count_show,
                        "count_add": count_add
                    },
                    success: function(data){ // после получения ответа сервера
                      if(data.result == "success"){
				        alert( 'все заебца' );
                        $('#content').append(data.html);
                        btn_more.val('Показать еще');
                        btn_more.attr('count_show', (count_show+3));
                      }else{
                        btn_more.val('Больше нечего показывать');
                      }
                    },
			
		           error: function( data ) {
		                alert( console.log(data) ) ;
	                }                             
                });
            });
        });     
</script>                                                                                                                   