/*
 * This file contains all the text input validators that are
 * required in login and register forms.
 */

String validateIsEmpty (String value) { 
  if(value.isEmpty){
    return "This field can't be empty";
  }
  return null;
}


String validateEmail(String value) {
	if(value.isEmpty) return "This field can't be empty";

	String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
		"\\@" +
		"[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
		"(" +
		"\\." +
		"[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
		")+";
	RegExp regExp =  RegExp(pattern);

	if(regExp.hasMatch(value)) return null;
		
	
	
    return 'Please enter a valid email';
}

String validatePassword(String value){
	if(value.isEmpty) return "This field can't be empty";
			
	// Password lenght can't be lesser than 8.
	if(value.length < 8) return 'Password length should be at least 8 characters';		
	
	return null;
}

String validateFullname(String value){
    if(value.isEmpty) return "This field can't be empty";       

    //Validator that avoid numbers and requires at least 2 characters.
    if(RegExp('[0-9]').hasMatch(value)) return "Numbers are not allowed";
    
    String pattern = "[a-zA-Z][a-zA-Z ]{2,}";

    RegExp regExp =  RegExp(pattern);

    if(regExp.hasMatch(value)) {
		return null;
	}
	
    return 'Please enter a valid name';
}

String validateConfirmPassword(String pass1, String pass2){
	if(pass1.isEmpty) return "This field can't be empty";       
	
    // Password lenght can't be lesser than 8.
	if(pass1.length < 8) return 'Password length should be at least 8 characters';
	
    if(pass1 != pass2) 	return 'Both password should match';
	
	return null;
}