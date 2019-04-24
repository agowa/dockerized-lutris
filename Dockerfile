FROM archlinux/base:latest as lutris

RUN \
  pacman -Syy --noconfirm && \
  pacman -S --noconfirm lutris
RUN \
  echo [multilib] >> /etc/pacman.conf && \
  echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf
RUN \
  pacman -Syy --noconfirm && \
  pacman -S --noconfirm nvidia nvidia-utils lib32-nvidia-utils nvidia-settings lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
RUN pacman -S --noconfirm iputils p7zip winetricks wine steam pciutils firefox sdl procps-ng
RUN useradd -m user

USER user
ENV USER=user
VOLUME /home/user

CMD ["lutris"]
