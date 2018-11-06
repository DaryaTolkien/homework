<div class="bask">Моя корзина</div> 
	
<div class="contentbas">
	
<form method="post" action="/zakaz/">
    <table border="1" class="tablebas">
   <tr>
    <th>№</th>
    <th>Наименование</th>
    <th>Количество</th>
    <th>Цена</th>
	<th> </th>
   </tr>
	{{TABLE}}
	</table>
	
	<input type="text" name="name" placeholder="Ваше имя" required>
	<input type="text" name="phone" placeholder="Ваш телефон" required>
	<input type="text" name="adres" placeholder="Ваш адрес" required>
	<input type="submit" name="zakaz" value="Оформить заказ!">
</form>	
</div>

