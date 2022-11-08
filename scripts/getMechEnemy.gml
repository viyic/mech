/// getMechEnemy()
var mechEnemy = noone;
with oMech {
    if not player {
        mechEnemy = id;
        break;
    }
}

return mechEnemy;
