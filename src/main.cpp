#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"

#include "core/playerfactory.h"
#include "core/playlist.h"
#include <QDebug>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/someplayer2/main.qml"));
    viewer.showExpanded();

    Player *player = PlayerFactory::instance()->getPlayer();
    Playlist *playlist = new Playlist(player);
    player->setPlaylist(playlist);
    playlist->addMedia(QUrl("file:///home/developer/MyDocs/Music/the_best/Nemo.mp3"));
    playlist->addMedia(QUrl("file:///home/developer/MyDocs/Music/the_best/Unspoken.mp3"));
    qWarning() << ":::::::" << playlist->savePlaylist(QUrl("file:///home/user/MyDocs/1.xspf"));
    qWarning() << ":::::::" << playlist->loadPlaylist(QUrl("file:///home/user/MyDocs/1.xspf"));
    qWarning() << "::" << playlist->error() << "::" << playlist->errorString();
    Track *track = playlist->trackAt(0);
    track = playlist->trackAt(1);
    playlist->removeMedia(0, 0);
    qWarning() << track->title() << track->artist() << track->album();
    player->play();
    return app->exec();
}
