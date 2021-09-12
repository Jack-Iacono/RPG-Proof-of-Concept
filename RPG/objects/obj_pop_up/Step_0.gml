/// @description Decrceases alpha for all entires in list
for(i = 0; i < array_length(text_alpha); i++){

	if(text_alpha[i] <= 0){
		array_delete(defender_text,0,1);
		array_delete(status_text,0,1);
		array_delete(text_alpha,0,1);
	}else{
		text_alpha[i] -= 0.0075;	
	}

}

