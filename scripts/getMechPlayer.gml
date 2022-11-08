/// getMechPlayer()
var mechPlayer = noone;
with oMech {
    if player {
        mechPlayer = id;
        break;
    }
}

return mechPlayer;
