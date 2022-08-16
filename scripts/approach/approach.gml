function approach(start, stop, step)
{
    if (start < stop) return min(start + step, stop); 
    else return max(start - step, stop);
}