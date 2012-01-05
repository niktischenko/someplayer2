#include "track.h"
#include <tag.h>
#include <fileref.h>
#include <QFile>
#include <QFileInfo>
#include <QDebug>

Track::Track(QObject *parent) :
    QObject(parent)
{
    _setDefault();
}

Track::Track(QMediaContent content, QObject *parent) :
    QObject(parent),
    _content(content)
{
    decode();
}

void Track::decode()
{
    _setDefault();
    QUrl url = _content.canonicalUrl();
    try {
        TagLib::FileRef fref(QFile::encodeName(url.toLocalFile()).data(), true, TagLib::AudioProperties::Fast);
        if (fref.isNull()) {
            throw 1;
        }
        TagLib::Tag *tag = fref.tag();
        if (NULL == tag) {
            throw 2;
        }
        TagLib::AudioProperties *properties = fref.audioProperties();
        if (NULL != properties) {
            _length = properties->length();
        }
        _title = QString::fromStdWString(tag->title().toWString()).trimmed();
        _artist = QString::fromStdWString(tag->artist().toWString()).trimmed();
        _album = QString::fromStdWString(tag->album().toWString()).trimmed();
        _year = tag->year();
    } catch (int code) {
        qWarning() << "[Track::decode] Caught code: " << code;
        QFileInfo finfo(QFile::encodeName(_content.canonicalUrl().toLocalFile()));
        _artist = finfo.suffix().toUpper().trimmed();
        _title = finfo.baseName().trimmed();
    }
    emit metaInfoChanged();
}

void Track::_setDefault()
{
    _title = "Unknown track";
    _artist = "Unknown artist";
    _album = "Unknown album";
    _year = 0;
    _length = 0;
}
