function openRoller(dice) {
	var diceTower = document.querySelector('#dice-tower');
	var diceAmount = diceTower.querySelector('#dice');
	diceAmount.innerHTML = dice;
}