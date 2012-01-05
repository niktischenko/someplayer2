#include "playlist.h"
#include <QDebug>

Playlist::Playlist(QObject *parent) :
    QMediaPlaylist(parent)
{
}

bool Playlist::savePlaylist(const QUrl &location)
{
    qWarning() << "Saving playlist to " << location;
    for (int i = 0; i < mediaCount(); i++) {
        qWarning() << "Saving " << media(i).canonicalUrl();
    }
    return true;
}

bool Playlist::loadPlaylist(const QUrl &location)
{
    qWarning() << "Loading playlist from " << location;
    emit loaded();
    return true;
}
