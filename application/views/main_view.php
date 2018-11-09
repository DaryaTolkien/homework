<div class="form">
<?php  print_r($data); ?>
	<form action="/" method="post">
	<span>Введите имя и пароль для входа</span>
		<input type="text" name="name" placeholder="Ваше имя" class="input">
		<input type="text" name="password" placeholder="Ваш пароль" class="input">
		<button class="input" name="submit" id="button">Войти </button>
	</form>
</div>