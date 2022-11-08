shoot = aiShootT > 0;

if aiShootT > 0 {
    aiShootT -= g.dt;
} else {
    if aiShootDelay > 0 {
        aiShootDelay -= g.dt;
    } else {
        aiShootT = random_range(SECOND, 3 * SECOND);
        aiShootDelay = random_range(1 * SECOND, 2 * SECOND);
    }
}
