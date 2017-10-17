FROM ubuntu:xenial
MAINTAINER Johannes Kienzle <jojohannes.kienzle@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
  && apt-get install -qy \
  && apt-get install -qy tex-common texinfo equivs perl-tk perl-doc wget \
  && wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xvzC /tmp \
  && mv /tmp/* /tmp/install-tl-unx \
  && echo "selected_scheme scheme-full" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXDIR /usr/local/texlive/2017" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFCONFIG ~/.texlive2017/texmf-config" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFHOME ~/texmf" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFLOCAL /usr/local/texlive/texmf-local" >> /tmp/install-tl-unx/texlive.profil \
  && echo "TEXMFSYSCONFIG /usr/local/texlive/2017/texmf-config" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFSYSVAR /usr/local/texlive/2017/texmf-var" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFVAR ~/.texlive2017/texmf-var" >> /tmp/install-tl-unx/texlive.profile \
  && echo "binary_x86_64-linux 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "instopt_adjustpath 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "instopt_adjustrepo 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "instopt_letter 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "instopt_portable 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "instopt_write18_restricted 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_autobackup 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_backupdir tlpkg/backups" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_create_formats 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_desktop_integration 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_file_assocs 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_generate_updmap 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_install_docfiles 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_install_srcfiles 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_post_code 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_sys_bin /usr/local/bin" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_sys_info /usr/local/share/info" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_sys_man /usr/local/share/man" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_w32_multi_user 1" >> /tmp/install-tl-unx/texlive.profile

RUN ["/tmp/install-tl-unx/install-tl", "--profile=/tmp/install-tl-unx/texlive.profile"]

ENV PATH="/usr/local/texlive/2017/bin/x86_64-linux:${PATH}"

WORKDIR /data
VOLUME ["/data"]
