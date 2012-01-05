#ifndef TRACK_H
#define TRACK_H

#include <QObject>
#include <QMediaContent>
#include <QUrl>

class Track : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString title READ title WRITE setTitle NOTIFY metaInfoChanged)
    Q_PROPERTY (QString artist READ artist WRITE setArtist NOTIFY metaInfoChanged)
    Q_PROPERTY (QString album READ album WRITE setAlbum NOTIFY metaInfoChanged)
    Q_PROPERTY (quint32 year READ year WRITE setYear NOTIFY metaInfoChanged)
    Q_PROPERTY (quint32 length READ length WRITE setLength NOTIFY metaInfoChanged)
    Q_PROPERTY (QUrl source READ source WRITE setSource NOTIFY sourceChanged)

public:
    explicit Track(QObject *parent = 0);
    explicit Track(QMediaContent content, QObject *parent = 0);
    QString title() const { return _title; }
    QString artist() const { return _artist; }
    QString album() const { return _album; }
    quint32 year() const { return _year; }
    quint32 length() const { return _length; }
    QUrl source() const { return _content.canonicalUrl(); }
    QMediaContent content() const { return _content; }

    void setTitle(const QString &title) { _title = title; emit metaInfoChanged(); }
    void setArtist(const QString &artist) { _artist = artist; emit metaInfoChanged(); }
    void setAlbum(const QString &album) { _album = album; emit metaInfoChanged(); }
    void setYear(quint32 year) { _year = year; emit metaInfoChanged(); }
    void setLength(quint32 length) { _length = length; emit metaInfoChanged(); }
    void setSource(const QUrl &source) { _content = QMediaContent(source); emit sourceChanged(); }
    void setContent(const QMediaContent &content) { _content = content; emit sourceChanged(); }
private:
    QString _title;
    QString _artist;
    QString _album;
    quint32 _year;
    quint32 _length;
    QMediaContent _content;

protected:
    void _setDefault();
    
signals:
    void metaInfoChanged();
    void sourceChanged();

public slots:
    void decode();
    
};

#endif // TRACK_H
