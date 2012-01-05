# Add more folders to ship with the application, here
folder_01.source = qml/someplayer2
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xED28F3DE

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
CONFIG += mobility
MOBILITY += multimedia sensors feedback

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
CONFIG += qdeclarative-boostable

LIBS += -lz

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += src/main.cpp \
    src/core/player.cpp \
    src/core/playerfactory.cpp \
    src/core/playlist.cpp \
    thirdparty/taglib/audioproperties.cpp \
    thirdparty/taglib/tagunion.cpp \
    thirdparty/taglib/tag.cpp \
    thirdparty/taglib/fileref.cpp \
    thirdparty/taglib/ape/apetag.cpp \
    thirdparty/taglib/ape/apeproperties.cpp \
    thirdparty/taglib/ape/apeitem.cpp \
    thirdparty/taglib/ape/apefooter.cpp \
    thirdparty/taglib/ape/apefile.cpp \
    thirdparty/taglib/asf/asftag.cpp \
    thirdparty/taglib/asf/asfproperties.cpp \
    thirdparty/taglib/asf/asfpicture.cpp \
    thirdparty/taglib/asf/asffile.cpp \
    thirdparty/taglib/asf/asfattribute.cpp \
    thirdparty/taglib/flac/flacunknownmetadatablock.cpp \
    thirdparty/taglib/flac/flacproperties.cpp \
    thirdparty/taglib/flac/flacpicture.cpp \
    thirdparty/taglib/flac/flacmetadatablock.cpp \
    thirdparty/taglib/flac/flacfile.cpp \
    thirdparty/taglib/mp4/mp4tag.cpp \
    thirdparty/taglib/mp4/mp4properties.cpp \
    thirdparty/taglib/mp4/mp4item.cpp \
    thirdparty/taglib/mp4/mp4file.cpp \
    thirdparty/taglib/mp4/mp4coverart.cpp \
    thirdparty/taglib/mp4/mp4atom.cpp \
    thirdparty/taglib/mpc/mpcproperties.cpp \
    thirdparty/taglib/mpc/mpcfile.cpp \
    thirdparty/taglib/mpeg/xingheader.cpp \
    thirdparty/taglib/mpeg/mpegproperties.cpp \
    thirdparty/taglib/mpeg/mpegheader.cpp \
    thirdparty/taglib/mpeg/mpegfile.cpp \
    thirdparty/taglib/mpeg/id3v1/id3v1tag.cpp \
    thirdparty/taglib/mpeg/id3v1/id3v1genres.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2tag.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2synchdata.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2header.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2framefactory.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2frame.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2footer.cpp \
    thirdparty/taglib/mpeg/id3v2/id3v2extendedheader.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/urllinkframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/unsynchronizedlyricsframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/unknownframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/uniquefileidentifierframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/textidentificationframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/relativevolumeframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/privateframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/popularimeterframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/generalencapsulatedobjectframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/commentsframe.cpp \
    thirdparty/taglib/mpeg/id3v2/frames/attachedpictureframe.cpp \
    thirdparty/taglib/ogg/xiphcomment.cpp \
    thirdparty/taglib/ogg/oggpageheader.cpp \
    thirdparty/taglib/ogg/oggpage.cpp \
    thirdparty/taglib/ogg/oggfile.cpp \
    thirdparty/taglib/ogg/vorbis/vorbisproperties.cpp \
    thirdparty/taglib/ogg/vorbis/vorbisfile.cpp \
    thirdparty/taglib/ogg/speex/speexproperties.cpp \
    thirdparty/taglib/ogg/speex/speexfile.cpp \
    thirdparty/taglib/ogg/flac/oggflacfile.cpp \
    thirdparty/taglib/riff/rifffile.cpp \
    thirdparty/taglib/riff/wav/wavproperties.cpp \
    thirdparty/taglib/riff/wav/wavfile.cpp \
    thirdparty/taglib/riff/aiff/aiffproperties.cpp \
    thirdparty/taglib/riff/aiff/aifffile.cpp \
    thirdparty/taglib/toolkit/unicode.cpp \
    thirdparty/taglib/toolkit/tstringlist.cpp \
    thirdparty/taglib/toolkit/tstring.cpp \
    thirdparty/taglib/toolkit/tmap.tcc \
    thirdparty/taglib/toolkit/tlist.tcc \
    thirdparty/taglib/toolkit/tfile.cpp \
    thirdparty/taglib/toolkit/tdebug.cpp \
    thirdparty/taglib/toolkit/tbytevectorlist.cpp \
    thirdparty/taglib/toolkit/tbytevector.cpp \
    thirdparty/taglib/trueaudio/trueaudioproperties.cpp \
    thirdparty/taglib/trueaudio/trueaudiofile.cpp \
    thirdparty/taglib/wavpack/wavpackproperties.cpp \
    thirdparty/taglib/wavpack/wavpackfile.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    thirdparty/taglib/CMakeLists.txt \
    thirdparty/taglib/taglib_config.h.cmake \
    thirdparty/taglib/taglib.pro \
    thirdparty/taglib/ape/CMakeLists.txt \
    thirdparty/taglib/ape/ape-tag-format.txt \
    thirdparty/taglib/asf/CMakeLists.txt \
    thirdparty/taglib/flac/CMakeLists.txt \
    thirdparty/taglib/mp4/CMakeLists.txt \
    thirdparty/taglib/mpc/CMakeLists.txt \
    thirdparty/taglib/mpeg/CMakeLists.txt \
    thirdparty/taglib/mpeg/id3v1/CMakeLists.txt \
    thirdparty/taglib/mpeg/id3v2/id3v2.4.0-structure.txt \
    thirdparty/taglib/mpeg/id3v2/id3v2.4.0-frames.txt \
    thirdparty/taglib/mpeg/id3v2/id3v2.3.0.txt \
    thirdparty/taglib/mpeg/id3v2/id3v2.2.0.txt \
    thirdparty/taglib/mpeg/id3v2/CMakeLists.txt \
    thirdparty/taglib/mpeg/id3v2/frames/CMakeLists.txt \
    thirdparty/taglib/ogg/CMakeLists.txt \
    thirdparty/taglib/ogg/vorbis/CMakeLists.txt \
    thirdparty/taglib/ogg/speex/CMakeLists.txt \
    thirdparty/taglib/ogg/flac/CMakeLists.txt \
    thirdparty/taglib/riff/CMakeLists.txt \
    thirdparty/taglib/riff/wav/CMakeLists.txt \
    thirdparty/taglib/riff/aiff/CMakeLists.txt \
    thirdparty/taglib/toolkit/CMakeLists.txt \
    thirdparty/taglib/trueaudio/CMakeLists.txt \
    thirdparty/taglib/wavpack/CMakeLists.txt

HEADERS += \
    src/core/player.h \
    src/core/playerfactory.h \
    src/core/playlist.h \
    thirdparty/taglib/audioproperties.h \
    thirdparty/taglib/tagunion.h \
    thirdparty/taglib/taglib_export.h \
    thirdparty/taglib/tag.h \
    thirdparty/taglib/fileref.h \
    thirdparty/taglib/ape/apetag.h \
    thirdparty/taglib/ape/apeproperties.h \
    thirdparty/taglib/ape/apeitem.h \
    thirdparty/taglib/ape/apefooter.h \
    thirdparty/taglib/ape/apefile.h \
    thirdparty/taglib/asf/asftag.h \
    thirdparty/taglib/asf/asfproperties.h \
    thirdparty/taglib/asf/asfpicture.h \
    thirdparty/taglib/asf/asffile.h \
    thirdparty/taglib/asf/asfattribute.h \
    thirdparty/taglib/flac/flacunknownmetadatablock.h \
    thirdparty/taglib/flac/flacproperties.h \
    thirdparty/taglib/flac/flacpicture.h \
    thirdparty/taglib/flac/flacmetadatablock.h \
    thirdparty/taglib/flac/flacfile.h \
    thirdparty/taglib/mp4/mp4tag.h \
    thirdparty/taglib/mp4/mp4properties.h \
    thirdparty/taglib/mp4/mp4item.h \
    thirdparty/taglib/mp4/mp4file.h \
    thirdparty/taglib/mp4/mp4coverart.h \
    thirdparty/taglib/mp4/mp4atom.h \
    thirdparty/taglib/mpc/mpcproperties.h \
    thirdparty/taglib/mpc/mpcfile.h \
    thirdparty/taglib/mpeg/xingheader.h \
    thirdparty/taglib/mpeg/mpegproperties.h \
    thirdparty/taglib/mpeg/mpegheader.h \
    thirdparty/taglib/mpeg/mpegfile.h \
    thirdparty/taglib/mpeg/id3v1/id3v1tag.h \
    thirdparty/taglib/mpeg/id3v1/id3v1genres.h \
    thirdparty/taglib/mpeg/id3v2/id3v2tag.h \
    thirdparty/taglib/mpeg/id3v2/id3v2synchdata.h \
    thirdparty/taglib/mpeg/id3v2/id3v2header.h \
    thirdparty/taglib/mpeg/id3v2/id3v2framefactory.h \
    thirdparty/taglib/mpeg/id3v2/id3v2frame.h \
    thirdparty/taglib/mpeg/id3v2/id3v2footer.h \
    thirdparty/taglib/mpeg/id3v2/id3v2extendedheader.h \
    thirdparty/taglib/mpeg/id3v2/frames/urllinkframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/unsynchronizedlyricsframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/unknownframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/uniquefileidentifierframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/textidentificationframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/relativevolumeframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/privateframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/popularimeterframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/generalencapsulatedobjectframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/commentsframe.h \
    thirdparty/taglib/mpeg/id3v2/frames/attachedpictureframe.h \
    thirdparty/taglib/ogg/xiphcomment.h \
    thirdparty/taglib/ogg/oggpageheader.h \
    thirdparty/taglib/ogg/oggpage.h \
    thirdparty/taglib/ogg/oggfile.h \
    thirdparty/taglib/ogg/vorbis/vorbisproperties.h \
    thirdparty/taglib/ogg/vorbis/vorbisfile.h \
    thirdparty/taglib/ogg/speex/speexproperties.h \
    thirdparty/taglib/ogg/speex/speexfile.h \
    thirdparty/taglib/ogg/flac/oggflacfile.h \
    thirdparty/taglib/riff/rifffile.h \
    thirdparty/taglib/riff/wav/wavproperties.h \
    thirdparty/taglib/riff/wav/wavfile.h \
    thirdparty/taglib/riff/aiff/aiffproperties.h \
    thirdparty/taglib/riff/aiff/aifffile.h \
    thirdparty/taglib/toolkit/unicode.h \
    thirdparty/taglib/toolkit/tstringlist.h \
    thirdparty/taglib/toolkit/tstring.h \
    thirdparty/taglib/toolkit/tmap.h \
    thirdparty/taglib/toolkit/tlist.h \
    thirdparty/taglib/toolkit/tfile.h \
    thirdparty/taglib/toolkit/tdebug.h \
    thirdparty/taglib/toolkit/tbytevectorlist.h \
    thirdparty/taglib/toolkit/tbytevector.h \
    thirdparty/taglib/toolkit/taglib.h \
    thirdparty/taglib/trueaudio/trueaudioproperties.h \
    thirdparty/taglib/trueaudio/trueaudiofile.h \
    thirdparty/taglib/wavpack/wavpackproperties.h \
    thirdparty/taglib/wavpack/wavpackfile.h \
    thirdparty/taglib/config.h

INCLUDEPATH += src \
    thirdparty/taglib \
    thirdparty/taglib/toolkit \
    thirdparty/taglib/riff \
    thirdparty/taglib/riff/wav \
    thirdparty/taglib/riff/aiff \
    thirdparty/taglib/mpc \
    thirdparty/taglib/ape \
    thirdparty/taglib/ogg \
    thirdparty/taglib/ogg/speex \
    thirdparty/taglib/ogg/vorbis \
    thirdparty/taglib/ogg/flac \
    thirdparty/taglib/mpeg \
    thirdparty/taglib/mpeg/id3v2 \
    thirdparty/taglib/mpeg/id3v2/frames \
    thirdparty/taglib/mpeg/id3v1 \
    thirdparty/taglib/asf \
    thirdparty/taglib/trueaudio \
    thirdparty/taglib/mp4 \
    thirdparty/taglib/flac \
    thirdparty/taglib/wavpack
