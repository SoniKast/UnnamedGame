/// @description fs_string_number_format(string, places, number)
/// @param strings
/// @param places
/// @param number
function fs_string_number_format(strings, places, number) 
{
	 // Places a Number in places.
  
	    var _string, _place;
	    _string = string(strings);
	    _place  = places-string_length(_string);
        
	    while(_place)
	    {
	          _string  = string(number) + _string;
	          _place  -= 1;
	    }

	    return _string;
}
