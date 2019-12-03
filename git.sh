#!/bin/sh

#NOME DAS BRANCHS DE TRABALHO
branch='master'


git status

echo "DESEJA CONTINUAR? [Ss,Nn] Padrao(S)"
read continuar

case "$continuar" in  
    s|S|"")
        git add .
        echo 'MENSAGEM PARA COMMIT'
        read message
        git commit -m "$message"
        git checkout master
        git pull
        git checkout $branch
       # echo " "
        #echo "MERGE MASTER PARA BRANCH! "
        echo " "
        git merge master
        echo "TEM CONFLITO? [Ss,Nn] Padrao(N)"
        read conflito
        case "$conflito" in  
            n|N|"")  
                echo "Git push PROJETOS"   
                echo ""  
                git checkout master
                git pull origin master
                git checkout $branch
            ;;
            *)
                echo "PROCESSO FINALIZADO - Ajuste os conflitos e realize o commit novamente."
            ;;
            esac
        echo " "
        echo "PROCESSO REALIZADO COM SUCESSO."
        
;;
*)
;;
esac