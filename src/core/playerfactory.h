#ifndef PLAYERFACTORY_H
#define PLAYERFACTORY_H

#include "player.h"

class PlayerFactory
{
public:
    static PlayerFactory *instance();
    Player *getPlayer();
private:
    PlayerFactory();
    static PlayerFactory *_instance;
    Player *_player;
};

#endif // PLAYERFACTORY_H
