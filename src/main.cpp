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
    player->play();
    qWarning() << ":::::::" << playlist->savePlaylist(QUrl("file:///home/user/MyDocs/1.plist"));
    qWarning() << "::" << playlist->error() << "::" << playlist->errorString();

    return app->exec();
}
