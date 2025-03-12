#! /bin/sh

echo "Installing tmux..."
sudo apt install tmux -y

tmux send-keys -t 1 C-b I

echo "Installing helix..."
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix -y

echo "Installing starship prompt..."
curl -sS https://starship.rs/install.sh | sh

# Append eval "$(starship init bash)" to ~/.bashrc if it's not already present
if ! grep -q 'eval "$(starship init bash)"' ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

echo "Applying themes and keybinds..."
mv .config ~/
mv .tmux.conf ~/
