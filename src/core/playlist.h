#ifndef PLAYLIST_H
#define PLAYLIST_H

#include <QMediaPlaylist>

class Playlist : public QMediaPlaylist
{
    Q_OBJECT
public:
    explicit Playlist(QObject *parent = 0);
    bool savePlaylist(const QUrl &location);
    bool loadPlaylist(const QUrl &location);
signals:
    
public slots:
    
};

#endif // PLAYLIST_H
