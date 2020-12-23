FROM fedora:32

RUN dnf -y install dnf-plugins-core         \
        && dnf -y install                   \
        CUnit-devel.x86_64                  \
        SDL2                                \
        SDL2-devel.x86_64                   \
        SDL2-static.x86_64                  \
        SFML.x86_64                         \
        SFML-devel.x86_64                   \
        autoconf                            \
        automake                            \
        gcc-c++.x86_64                      \
        gcc.x86_64                          \
        git                                 \
        unzip.x86_64                        \
        make.x86_64

COPY fs /

RUN cd /tmp \
    && bash build_csfml.sh \
    && rm -rf /tmp/* \
    && chmod 1777 /tmp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
