#include "crow.h"
#include "spdlog/spdlog.h"
#include <iostream>
#include <memory>
#include <string>
#include <signal.h>
#include "container.hpp"

namespace spd = spdlog;

void sighandler(int sig)
{
    cout<< "Signal " << sig << " caught..." << endl;
    exit(0);
}

int main()
{
    signal(SIGABRT, &sighandler);
    signal(SIGTERM, &sighandler);
    signal(SIGINT, &sighandler);

    AppObject *obj = new AppObject();
    obj->logger->debug("Application started...");
    obj->setRoutes();
    
    obj->getRouter()->port(18080).multithreaded().run();

    spd::drop_all();
    delete obj; // release memory

}