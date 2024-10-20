Sous Docker, installation de 2 conteneurs sous Apache avec un reverse-proxy sous Nginx  
======================================================================================  
  
Docker : Docker version 27.0.3, build 7d4bcd8  


#### 1/ Instruction pour construire et lancer l'infrastructure.
    
* Construction de l'environnement :  

```
$ docker compose build
``` 


* Lancement de l'infrastructure :

```
$ docker compose up
```


* Arrêt de l'infrastructure :

```
$ docker compose stop
```


* Liens :  

[http://serveur01.labo.dev/](http://serveur01.labo.dev/)  
[http://serveur02.labo.dev/](http://serveur02.labo.dev/)  
  
[http://serveur01dbadmin.labo.dev](http://serveur01dbadmin.labo.dev)  
[http://serveur02dbadmin.labo.dev](http://serveur02dbadmin.labo.dev)  



#### 2/ Certificats auto-signés (pour local).

- Génération des certificats auto-signés :

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt
```

- Ajout du certificat aux autorités de certification :

```
$ sudo cp serveur03/certs/nginx-selfsigned.crt /usr/local/share/ca-certificates/ 
$ sudo update-ca-certificates
```

- Open Firefox and go to the Main menu through the hamburger menu in the top-left and select Options
Select Privacy & Security and scroll down to Certificates
Select View Certificates and the Certificate Manager window opens
Select Authorities and select Import
Locate the created ca.crt certificate file and select Open
Select the Trust this CA to identify websites checkbox and select Ok 

- Redémarrer le navigateur web.

