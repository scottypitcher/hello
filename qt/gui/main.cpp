#include <QApplication>
#include <QWidget>
#include <QLabel>
#include <QObject>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QWidget w;
    QLabel *l = new QLabel(&w);

    w.resize(640, 360);
    w.setWindowTitle("Hello, world!");
    l->setText("Hello world.");
    l->setMargin(5);
    w.show();

    return app.exec();
}
