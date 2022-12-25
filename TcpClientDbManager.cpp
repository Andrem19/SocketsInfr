#include "TcpServerController.h"
#include "TcpClientDbManager.h"
#include "TcpClient.h"

TcpClientDbManager::TcpClientDbManager(TcpServerController *tcp_ctrlr){
    this->tcp_ctrlr = tcp_ctrlr;
    pthread_rwlock_init(&this->rwlock, NULL);
}

TcpClientDbManager::~TcpClientDbManager(){
    pthread_rwlock_destroy(&this->rwlock);
}

void TcpClientDbManager::StartTcpClientDbInit(){

}

void TcpClientDbManager::AddClientToDB(TcpClient *tcp_client) {

    pthread_rwlock_wrlock(&this->rwlock);
    this->tcp_client_db.push_back(tcp_client);
    pthread_rwlock_unlock(&this->rwlock);
}

void TcpClientDbManager::DisplayClientDb() {

    std::list<TcpClient *>::iterator it;
    TcpClient *tcp_client;

    pthread_rwlock_rdlock(&this->rwlock);
    for (it = this->tcp_client_db.begin(); it != this->tcp_client_db.end(); ++it) {
        tcp_client = *it;
        tcp_client->Display();
    }
    pthread_rwlock_unlock(&this->rwlock);
}

void TcpClientDbManager::CopyAllClientsTolist (std::list<TcpClient *> *list) {

    std::list<TcpClient *>::iterator it;
    TcpClient *tcp_client;

     pthread_rwlock_rdlock(&this->rwlock);
    for (it = this->tcp_client_db.begin(); it != this->tcp_client_db.end(); ++it) {
        tcp_client = *it;
        list->push_back(tcp_client);
    }
    pthread_rwlock_unlock(&this->rwlock);
}