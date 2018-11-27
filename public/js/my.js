function f(id_auhtor){ //Сортировка по авторам
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
			table += '<a href="" class="catalog_buy-button" onclick="addBasket(' +value.id + ')" id="a">add</a></div>';
			$('#x').empty();
			$('#x').append(table);
             });
	}
	});
   }

function addBasket(id){ //Добавление в корзину 
	$('body').one('click', 'a#a', function(event){
    event.preventDefault(); 
  $.ajax({
    url:"/basket/",
    type:"POST",
	cache:false,
	async: true,
    data:{ add_id },
    error: function (req, text, error) { // отслеживание ошибок во время выполнения ajax-запроса
           alert('Ошибочка! ' + text + ' : ' + error);
        },
    success: function (response){
		var obj = jQuery.parseJSON(response);
		    $.each(obj, function(key,value) {
				 console.log(value.amount);
			    // $('#amount_header').empty();
		         $('#amount_header').html('&#8381; : ' + value.amount);
             });
		//$('#amount_header').empty();
		//$('#amount_header').html('&#8381; : ' + obj[0].amount);
    }
});
});
}


$(document).ready(function(){ //Функция загрзки фото
  var files;
  $('input[type=file]').on('change', function(){
	files = this.files;
	});

  $('.sbutton').on('click', function(event){
	event.preventDefault(); 
	//var imgfile = $('imgfile').prop('files')[0];
	var idfile = $('#idphoto').val();
	if( typeof files == 'undefined' ) return; // ничего не делаем если files пустой
	var data = new FormData(); // создадим объект данных формы
		
	$.each( files, function( key, value ){ // заполняем объект данных файлами в подходящем для отправки формате
		data.append( key, value );
	});
	
	data.append( 'my_file_upload', 1 ); // добавим переменную для идентификации запроса
	  $.ajax({
    url:"/user/",
    type:"POST",
	cache:false,
	async: true,
    processData : false,
    data:{ data : data, idfile : idfile },
    error: function (req, text, error) { // отслеживание ошибок во время выполнения ajax-запроса
           alert('Ошибочка! ' + text + ' : ' + error);
        },
    success: function (response){
		alert(response);
		//alert('kdkdkkd');
    }	  
  });
 });
});
/*
function addPhoto(id, imgfile){ //Добавление фото в линчный кабинет
	//$('body').one('click', 'input#input_img', function(event){
	
    //event.preventDefault(); 
  $.ajax({
    url:"/user/",
    type:"POST",
	cache:false,
	async: true,
    data:{ add_id },
    error: function (req, text, error) { // отслеживание ошибок во время выполнения ajax-запроса
           alert('Ошибочка! ' + text + ' : ' + error);
        },
    success: function (response){
		var obj = jQuery.parseJSON(response);
		    $.each(obj, function(key,value) {
				 console.log(value.amount);
			    // $('#amount_header').empty();
		         $('#amount_header').html('&#8381; : ' + value.amount);
             });
		//$('#amount_header').empty();
		//$('#amount_header').html('&#8381; : ' + obj[0].amount);
    }
});
//});
}
*/


//Модальное окно


$(document).ready(function() { // вся мaгия пoсле зaгрузки стрaницы
	$('a#amount_header').click( function(event){ // лoвим клик пo ссылки с id="go"
		event.preventDefault(); // выключaем стaндaртную рoль элементa
		$('.overlay').fadeIn(400, // снaчaлa плaвнo пoкaзывaем темную пoдлoжку
		 	function(){ // пoсле выпoлнения предъидущей aнимaции
				$('#modal_form') 
					.css('display', 'block') // убирaем у мoдaльнoгo oкнa display: none;
					.animate({opacity: 1, top: '50%'}, 200); // плaвнo прибaвляем прoзрaчнoсть oднoвременнo сo съезжaнием вниз
		});
	});
	/* Зaкрытие мoдaльнoгo oкнa, тут делaем тo же сaмoе нo в oбрaтнoм пoрядке */
	$('#modal_close, .overlay').click( function(){ // лoвим клик пo крестику или пoдлoжке
		$('#modal_form')
			.animate({opacity: 0, top: '45%'}, 200,  // плaвнo меняем прoзрaчнoсть нa 0 и oднoвременнo двигaем oкнo вверх
				function(){ // пoсле aнимaции
					$(this).css('display', 'none'); // делaем ему display: none;
					$('.overlay').fadeOut(400); // скрывaем пoдлoжку
				}
			);
	});
});

function Constellation (canvas) {
  var _this = this,
      context = canvas.getContext('2d'),
      config = {
        star: {
          color: 'rgba(168, 250, 255, .4)',
          width: 3
        },
        line: {
          color: 'rgba(168, 250, 255, .4)',
          width: 0.2
        },
        position: {
          x: 0,
          y: 0
        },
        width: window.innerWidth,
        height: window.innerHeight,
        length: Math.sqrt( Math.pow(window.innerWidth, 2) + Math.pow(window.innerHeight, 2) ) / 10,
        distance: 120,
        radius: 150,
        stars: []
      };

  function Star () {
    this.x = Math.random() * canvas.width;
    this.y = Math.random() * canvas.height;
    this.radius = Math.random() * config.star.width;

    this.vx = (0.5 - Math.random())/5;
    this.vy = (0.5 - Math.random())/5;

    this.create = function() {
      context.beginPath();
      context.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
      context.fill();
    };
  }

  this.animate = function() {
    var i;
    for (i = 0; i < config.length; i++) {

      var star = config.stars[i];

      if (star.y < 0 || star.y > canvas.height) {
        star.vy = - star.vy;
      } else if (star.x < 0 || star.x > canvas.width) {
        star.vx = - star.vx;
      }

      star.x += star.vx;
      star.y += star.vy;
    }
  };

  this.line = function() {
    var length = config.length,
        iStar,
        jStar,
        i,
        j;

    for (i = 0; i < length; i++) {
      for (j = 0; j < length; j++) {
        iStar = config.stars[i];
        jStar = config.stars[j];

        if (
          (iStar.x - jStar.x) < config.distance &&
          (iStar.y - jStar.y) < config.distance &&
          (iStar.x - jStar.x) > - config.distance &&
          (iStar.y - jStar.y) > - config.distance
        ) {
          if (
            (iStar.x - config.position.x) < config.radius &&
            (iStar.y - config.position.y) < config.radius &&
            (iStar.x - config.position.x) > - config.radius &&
            (iStar.y - config.position.y) > - config.radius
          ) {
            context.beginPath();
            context.moveTo(iStar.x, iStar.y);
            context.lineTo(jStar.x, jStar.y);
            context.stroke();
            context.closePath();
          }
        }
      }
    }
  };

  this.createStars = function () {
    context.clearRect(0, 0, canvas.width, canvas.height);

    for (var i = 0; i < config.length; i++) {
      config.stars.push(new Star());
      config.stars[i].create();
    }

    _this.animate();
    _this.line();
  };

  this.setCanvas = function () {
    canvas.width = config.width;
    canvas.height = config.height;
  };

  this.setContext = function () {
    context.fillStyle = config.star.color;
    context.strokeStyle = config.line.color;
    context.lineWidth = config.line.width;
  };

  this.loop = function (callback) {
    callback();

    window.requestAnimationFrame(function () {
      _this.loop(callback);
    });
  };

  this.bind = function () {
    canvas.addEventListener("mousemove", function(e){
      config.position.x = e.pageX - canvas.offsetLeft;
      config.position.y = e.pageY - canvas.offsetTop;
    });
  };

  this.init = function () {
    this.setCanvas();
    this.setContext();
    this.loop(this.createStars);
    this.bind();
  };
}

document.addEventListener("DOMContentLoaded", function() {
  var c = new Constellation(document.getElementById('canvas'));
  c.init();
});






























	