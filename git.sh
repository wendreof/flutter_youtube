#!/bin/sh

git status

echo "DESEJA CONTINUAR? [Ss,Nn] Padrao(S)"
read continuar

case "$continuar" in  
    s|S|"")
        git add .
        echo 'MENSAGEM PARA COMMIT'
        read message
        git commit -m "$message"
        git pull
       
       # echo " "
        #echo "MERGE MASTER PARA BRANCH! "
        echo " "
       
        echo "TEM CONFLITO? [Ss,Nn] Padrao(N)"
        read conflito
        case "$conflito" in  
            n|N|"")  
                echo "Git push PROJETOS"   
                echo " "
             
                git push origin master
            ;;
            *)
                echo "PROCESSO FINALIZADO - Ajuste os conflitos e realize o commit novamente."
            ;;
            esac
        echo " "
        echo "PROCESSO REALIZADO COM SUCESSO!"
        
;;
*)
;;
esac