function f(id_auhtor){
	$.ajax({
		type: "GET",
		url: "/",
		data: {id_auhtor},
		//dataType: 'json', 
		//contentType: 'application/json',
		error: function (req, text, error) { // отслеживание ошибок во время выполнения ajax-запроса
            alert('Ошибочка! ' + text + ' : ' + error);
        },
	    success: function (response) {
			var obj = jQuery.parseJSON(response);
			var table = '';
            $.each(obj, function(key,value) {
            table += '<div class="product">';
			table += '<a href="catalog/?id=' +value.id + '"class="menu-link">';
			table += '<div>' +value.title + '</div>';
			table += '<img src="/images/' +value.image + '" class="catalog-image">';
			table += '<div class="price-book" id="price">' +value.price + ' &#8381;</div></a>';
			table += '<a href="/basket/?getgood=' +value.id + '" class="catalog_buy-button">add</a></div>';
			$('#x').empty();
			$('#x').append(table);
             });
	}
	});
   }

function addBasket(add_id){
$.ajax({
    url:"/basket/",
    type:"GET",
    data:{ add_id },
    error: function (req, text, error) { // отслеживание ошибок во время выполнения ajax-запроса
           alert('Ошибочка! ' + text + ' : ' + error);
        },
    success: function (response){
        alert('Товар добавлен в корзину!!!');
    }
});
}
	