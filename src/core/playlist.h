#ifndef PLAYLIST_H
#define PLAYLIST_H

#include <QMediaPlaylist>
#include <QMap>
#include "track.h"

class Playlist : public QMediaPlaylist
{
    Q_OBJECT
    Q_PROPERTY (QString name READ name WRITE setName NOTIFY nameChanged)
public:
    explicit Playlist(QObject *parent = 0);
    bool savePlaylist(const QUrl &location);
    bool loadPlaylist(const QUrl &location);
    Track* trackAt(int position);

    QString name() const { return _name; }

    void setName(const QString &name) { _name = name; emit nameChanged(); }
protected:
    QString _name;
    QMap<QUrl, Track *> _tracks_cache;

protected slots:
    void handleItemsRemoving(int start, int end);

signals:
    void nameChanged();
    
public slots:
    
};

#endif // PLAYLIST_H
