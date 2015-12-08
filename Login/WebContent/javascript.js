/**
 * 
 */

//function for alert pop up on successful DB insert
function displayResults() {
	if (document.myForm.hidden.value == 1) {
		alert("You are registered!  Please login :)")
		location.href="index.jsp"
	}
}