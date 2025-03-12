#! /bin/sh


HELIX_PPA="ppa:maveonair/helix-editor"

if ! command -v tmux >/dev/null; then
    echo "Installing tmux..."
    sudo apt-get install tmux -y
else 
    echo "tmux already installed."
fi


if ! grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep helix >/dev/null; then
    echo "Adding PPA..."
    sudo add-apt-repository ppa:maveonair/helix-editor
    sudp apt-get update
else 
    echo "PPA already added."
fi

if ! command -v hx >/dev/null; then
    echo "Installing helix..."
    sudo apt-get install helix -y
else 
    echo "Helix already installed."
fi

if ! command -v starship >/dev/null; then
    echo "Installing starship prompt..."
    curl -sS https://starship.rs/install.sh | sh
    # Append eval "$(starship init bash)" to ~/.bashrc if it's not already present
    if ! grep -q 'eval "$(starship init bash)"' ~/.bashrc; then
        echo 'eval "$(starship init bash)"' >> ~/.bashrc
    fi
else 
    echo "Starship already installed."
fi 

echo "Applying themes and keybinds..."
cp -r .config ~/
cp .tmux.conf ~/

echo "Make sure to enable tmux plugins using C-b I"
