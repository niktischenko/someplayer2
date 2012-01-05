#include "playlist.h"
#include <QDebug>
#include <QFile>
#include <QFileInfo>
#include <QTextStream>
#include <QtXml/QDomDocument>
#include <QtXml/QDomElement>

Playlist::Playlist(QObject *parent) :
    QMediaPlaylist(parent)
{
    connect (this, SIGNAL(mediaAboutToBeRemoved(int,int)), this, SLOT(handleItemsRemoving(int,int)));
}

bool Playlist::savePlaylist(const QUrl &location)
{
    qWarning() << "Saving playlist to " << location;

    QString filename = location.toLocalFile();

    QFile playlistFile(filename);
    if (playlistFile.exists()) {
        playlistFile.remove();
    }
    playlistFile.open(QFile::WriteOnly);
    QTextStream stream(&playlistFile);
    QDomDocument doc;
    QDomElement root = doc.createElement("playlist");
    root.setAttribute("version", "1");
    root.setAttribute("xmlns", "http://xspf.org/ns/0/");
    root.setAttribute("xmlns:cl", "http://someplayer2.some-body.ru/playlists-scheme/");
    QDomElement tracklist = doc.createElement("trackList");
    for (int i = 0; i < mediaCount(); i++) {
        Track *track = trackAt(i);
        QDomElement etrack = doc.createElement("track");
        QDomElement elocation = doc.createElement("location");
        QDomElement eextension = doc.createElement("extension");
        QDomElement ecl_clip = doc.createElement("cl:clip");
        QDomElement etitle = doc.createElement("title");
        QDomElement eduration = doc.createElement("duration");
        etitle.appendChild(doc.createTextNode(QString("%1 - %2").arg(track->artist()).arg(track->title())));
        ecl_clip.setAttribute("title", track->title());
        ecl_clip.setAttribute("artist", track->artist());
        ecl_clip.setAttribute("album", track->album());
        eextension.appendChild(ecl_clip);
        eextension.setAttribute("application", "http://example.com");
        QUrl url = track->source();
        elocation.appendChild(doc.createTextNode(QString("%1").arg(url.toEncoded().constData())));
        eduration.appendChild(doc.createTextNode(QString("%1").arg(track->length()*1000)));
        etrack.appendChild(elocation);
        etrack.appendChild(eextension);
        etrack.appendChild(etitle);
        etrack.appendChild(eduration);
        tracklist.appendChild(etrack);
    }
    root.appendChild(tracklist);
    doc.appendChild(root);
    stream << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
    stream << doc.toString();

    return true;
}

bool Playlist::loadPlaylist(const QUrl &location)
{
    clear();
    qWarning() << "Loading playlist from " << location;
    QFile playlistFile(location.toLocalFile());
    QFileInfo finfo = QFileInfo(playlistFile.fileName());

    if (playlistFile.exists()) {
        _name = finfo.baseName();
        QDomDocument doc;
        playlistFile.open(QFile::ReadOnly);
        doc.setContent(&playlistFile);
        playlistFile.close();
        QDomElement eplaylist = doc.documentElement();
        if (eplaylist.tagName() == "playlist") {
            QDomElement etracklist = eplaylist.firstChildElement("trackList");
            if (!etracklist.isNull()) {
                QDomElement etrack = etracklist.firstChildElement("track");
                while (!etrack.isNull()) {
                    QDomElement elocation = etrack.firstChildElement("location");
                    QDomElement eextension = etrack.firstChildElement("extension");
                    if (!eextension.isNull()) {
                        QDomElement ecl_clip = eextension.firstChildElement("cl:clip");
                        if (!ecl_clip.isNull()) {
                            QString artist = ecl_clip.attribute("artist");
                            QString album = ecl_clip.attribute("album");
                            QString title = ecl_clip.attribute("title");
                            QDomElement eduration = etrack.firstChildElement("duration");
                            if (!eduration.isNull()) {
                                QVariant duration = eduration.text();
                                QByteArray basource;
                                basource.append(elocation.text());
                                QUrl url = QUrl::fromEncoded(basource);
                                Track *track = new Track(this);
                                track->setAlbum(album);
                                track->setArtist(artist);
                                track->setLength(duration.toUInt());
                                track->setTitle(title);
                                track->setSource(url);
                                addMedia(track->content());
                                _tracks_cache[track->content().canonicalUrl()] = track;
                            }
                        }
                    }
                    etrack = etrack.nextSiblingElement("track");
                }
            }
        }
    }
    emit loaded();
    return true;
}

Track *Playlist::trackAt(int position)
{
    QMediaContent content = media(position);
    if (!_tracks_cache.keys().contains(content.canonicalUrl())) {
        _tracks_cache[content.canonicalUrl()] = new Track(content, this);
    }
    return _tracks_cache[content.canonicalUrl()];
}

void Playlist::handleItemsRemoving(int start, int end)
{
    for (int i = start; i <= end; i++) {
        QUrl url = media(i).canonicalUrl();
        if (!_tracks_cache.keys().contains(url)) {
            continue;
        }
        qDebug() << "Removing cached track for " << url;
        delete _tracks_cache[url];
        _tracks_cache.remove(url);
    }
}
