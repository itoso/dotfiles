#!/bin/bash -exv

echo "[INSTALLER] Installing Homebrew" & {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

echo "[INSTALLER] Installing basic tools" & {
    brew install openssl;
    brew install git;
    brew install jq
    brew install ag
}

echo "[INSTALLER] Installing anyenv and anyenv-update" & {
    ANYENV_ROOT="${HOME}/.anyenv";

    git clone https://github.com/riywo/anyenv ${ANYENV_ROOT}
    export PATH="${ANYENV_ROOT}/bin:$PATH";
    eval "$(anyenv init -)"

    mkdir -p ${ANYENV_ROOT}/plugins
    git clone https://github.com/znz/anyenv-update ${ANYENV_ROOT}/plugins/anyenv-update
}

echo "[INSTALLER] Set up Python" & {
    anyenv install pyenv
    
    PYENV_ROOT=$(pyenv root)
    git clone https://github.com/yyuu/pyenv-virtualenv ${PYENV_ROOT}/plugins/pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"

    PYTHON3_LATEST=$(PYENV Install -l | egrep '^\s*3[0-9.]+$' | sort | tail -1)
    pyenv install -v ${PYTHON3_LATEST}
    pyenv global ${PYTHON3_LATEST}
}

echo "[INSTALLER] Set up Node js" & {
    anyenv install nodenv
    NODE_LATEST=$(nodenv install -l | egrep '^\s*9[0-9.]+$' | sort | tail -1)
    nodenv install -v ${NODE_LATEST}
}

echo "[INSTALLER] Installing NeoVim and Gtags" & {
    brew install nvim
    pip3 install neovim
}

echo "[INSTALLER] Installing AWS tools" & {
    pip3 install awscli
}

