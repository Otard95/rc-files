alias php='sudo service apache2'
alias purge-docker='printf "\n######### Prune docker system\n\n" \
  && docker system prune -a \
  && printf "\n######### Prune docker volumes\n\n" \
  && docker volume prune \
  && printf "\n######### Images\n\n" \
  && docker images \
  && printf "\n######### Containers\n\n" \
  && docker ps \
  && printf "\n######### Volumes\n\n" \
  && docker volume ls'
alias rm=trash
alias p='xclip -o | bash'
alias newpush="git push 2>&1 | tail -2 | bash"
alias onivim="/usr/local/bin/Onivim2-x86_64.AppImage"
alias cd..="cd .."
alias mine='sudo chown $(whoami) -R $1'
alias mod="~/scripts/more"

