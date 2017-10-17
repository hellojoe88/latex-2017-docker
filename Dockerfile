FROM ubuntu:xenial
MAINTAINER Johannes Kienzle <jojohannes.kienzle@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
  && apt-get install -qy \
  && apt-get install -qy tex-common texinfo equivs perl-tk perl-doc wget \
  && wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xvzC /tmp \
  && mv /tmp/* /tmp/install-tl-unx \
  && echo "selected_scheme scheme-custom" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXDIR /usr/local/texlive/2017" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFCONFIG ~/.texlive2017/texmf-config" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFHOME ~/texmf" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFLOCAL /usr/local/texlive/texmf-local" >> /tmp/install-tl-unx/texlive.profil \
  && echo "TEXMFSYSCONFIG /usr/local/texlive/2017/texmf-config" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFSYSVAR /usr/local/texlive/2017/texmf-var" >> /tmp/install-tl-unx/texlive.profile \
  && echo "TEXMFVAR ~/.texlive2017/texmf-var" >> /tmp/install-tl-unx/texlive.profile \
  && echo "binary_x86_64-linux 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-basic 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-bibtexextra 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-binextra 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-context 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-fontsextra 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-fontsrecommended 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-fontutils 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-formatsextra 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-games 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-humanities 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-latex 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-latexextra 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-latexrecommended 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-luatex 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-mathscience 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-metapost 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-music 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-pictures 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-plaingeneric 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-pstricks 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-publishers 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-texworks 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-xetex 1" >> /tmp/install-tl-unx/texlive.profile \
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
  && echo "tlpdbopt_install_docfiles 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_install_srcfiles 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_post_code 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_sys_bin /usr/local/bin" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_sys_info /usr/local/share/info" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_sys_man /usr/local/share/man" >> /tmp/install-tl-unx/texlive.profile \
  && echo "tlpdbopt_w32_multi_user 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langarabic 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langchinese 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langcjk 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langcyrillic 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langczechslovak 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langenglish 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langeuropean 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langfrench 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langgerman 1" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langgreek 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langitalian 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langjapanese 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langkorean 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langother 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langpolish 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langportuguese 0" >> /tmp/install-tl-unx/texlive.profile \
  && echo "collection-langspanish 0" >> /tmp/install-tl-unx/texlive.profile

RUN ["/tmp/install-tl-unx/install-tl", "--profile=/tmp/install-tl-unx/texlive.profile"]

ENV PATH="/usr/local/texlive/2017/bin/x86_64-linux:${PATH}"

WORKDIR /data
VOLUME ["/data"]
