#ifndef PLAYER_H
#define PLAYER_H

#include <QMediaPlayer>

class Player : public QMediaPlayer
{
    Q_OBJECT
public:
    explicit Player(QObject *parent = 0);
    
signals:
    
public slots:
    
};

#endif // PLAYER_H
