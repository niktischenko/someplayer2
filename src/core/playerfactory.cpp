#include "playerfactory.h"

PlayerFactory *PlayerFactory::_instance = NULL;

PlayerFactory::PlayerFactory()
{
    _player = NULL;
}

PlayerFactory *PlayerFactory::instance()
{
    if (NULL == _instance) {
        _instance = new PlayerFactory();
    }
    return _instance;
}

Player *PlayerFactory::getPlayer()
{
    if (NULL == _player) {
        _player = new Player();
    }
    return _player;
}
