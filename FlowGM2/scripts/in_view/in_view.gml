function in_view()
{
 // Checks if an instance is inside the view. 
 // This can be used to prevent objects from falling of the stage if terrain doesn't load fast enough.
 
    if((bbox_right > VIEW_X) && (bbox_left < VIEW_X + VIEW_W) && (bbox_bottom > VIEW_Y&& (bbox_top < VIEW_Y + VIEW_H))) 
    {
       return true;
    }
    else return false;
}
