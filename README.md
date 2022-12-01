## STEP 0: Clonar o repositório

```console
labredes@host:~$ git clone git@github.com:miguelxvr/dhcptest-workspace.git
```

## STEP 1: Criar uma imagem Docker para ambiente de testes

```console
labredes@host:~$ docker build -t dhcptest . 
```

## STEP 2: Iniciar o DHCP server (observe os parametros)

```console
labredes@host:~$ docker run -it --rm dhcptest dhcplayer server -I eth0 -v --dhcp 192.168.100.1 --start-ip 192.168.100.2 --end-ip 192.168.100.10 --mask 255.255.255.0 --router 192.168.100.1 --dns 192.168.100.1 --wpad http://wpadserver.local/wpad.dat 
```

## STEP 3: Abrir wireshark na máquina host e fazer attach na interface virtual do Docker (eg. veth...)

```console
labredes@host:~$ wireshark
```

## STEP 4: Rodar o DHCP client e observar a saída no wireshark

```console
foo@host:~$ docker run -it --rm dhcptest dhcplayer discover -I eth0
```

![alt text](https://github.com/miguelxvr/dhcptest-workspace/blob/master/wireshark-output.png?raw=true)
