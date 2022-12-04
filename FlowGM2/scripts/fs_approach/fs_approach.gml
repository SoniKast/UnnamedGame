/// @description fs_approach(handle, end, change)
 // Approaches a value to a given end point at a fixed rate (change)
 
function fs_approach(app_handle, app_end, app_change)
{
	
    if(app_handle < app_end)
    {
       return min(app_handle+app_change, app_end);
    }
    else
    {
       return max(app_handle-app_change, app_end);
    }
	
}