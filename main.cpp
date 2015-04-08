#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <plugins.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Plugins p;
    p.registerTypes("Bacon2D");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
