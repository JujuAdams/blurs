var _string = "Blur examples\n@jujuadams\n\nPress any key to cycle blend modes\n\n";

switch(mode)
{
    case 0: _string += "Gaussian"; break;
    case 1: _string += "Sigmoid"; break;
    case 2: _string += "Linear"; break;
}

draw_text(10, 10, _string);