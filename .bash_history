#1658856371
tmux
#1659562726
tmuxp
#1659562731
tmuxp load
#1659562751
tmuxp load .
#1659562755
la
#1659562770
ls .config/
#1659562783
ls .tmuxp/0.yaml 
#1659562826
tmuxp load 0
#1659562889
vi .tmuxp/0.yaml 
#1659563353
mv .tmuxp/0.yaml .tmuxp/cube.yaml
#1659563359
tmuxp load cube
#1659563392
vi .tmuxp/cube.yaml 
#1659563458
tmuxp load cube
#1659563852
ls src/
#1659702780
hist
#1659702796
ls
#1659702802
tmux
#1660071688
tmux attach
#1660072406
tmux
#1660072548
cat .bashrc 
#1660072565
nvm --help
#1660072583
nvm install-latest-npm 
#1660072600
nvm install --lts
#1660072611
nvm install-latest-npm 
#1660072643
pip --version
#1660072663
pip install yq
#1660072682
. .bashrc 
#1660072690
echo $CUBE_PERSONAL_ACCESS_TOKEN 
#1660072699
cat .bashrc 
#1660072710
shellcheck .bashrc 
#1660073119
vi .bashrc 
#1660073177
shellcheck .bashrc 
#1660073201
shellcheck .bashrc --exclude=SC1090
#1660073217
vi .bashrc 
#1660073292
shellcheck .bashrc --exclude=SC1090
#1660073502
bash --version
#1660073514
echo $EPOCHREALTIME 
#1660073525
echo $EPOCHSECONDS 
#1660073551
printenv |grep TIME
#1660073557
printenv 
#1660073565
env
#1660073881
cd src/cube-env
#1660073882
ls
#1660074420
podman
#1660145934
sudo apt update
#1660145954
sudo apt dist-upgrade 
#1660146190
cat /var/log/dpkg.log 
#1660146293
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
#1660146313
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)|wc -l
#1660146401
find /var/log/apt/ -type d
#1660146413
ls /var/log/apt/
#1660146426
cat /var/log/apt/term.log 
#1660146441
cat /var/log/apt/term.log |less
#1660146527
apt-mark showmanual
#1660146607
lsb_release -a
#1660146694
wget http://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-live-server-amd64.manifest
#1660146696
ls
#1660146710
less ubuntu-20.04.4-live-server-amd64.manifest 
#1660146738
cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest 
#1660146792
comm -23 <(cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest) <(apt-mark manual)
#1660146809
comm <(cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest) <(apt-mark manual)
#1660146841
comm <(cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest | sort -u) <(apt-mark manual | sort -u)
#1660146859
cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest |sort -u
#1660146875
apt-mark showmanual
#1660146882
cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest |sort -u
#1660146896
cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest |sort -u >base
#1660146905
apt-mark showmanual >installed
#1660146910
diff -y base installed 
#1660146965
comm base installed 
#1660147022
comm -2 base installed 
#1660147033
comm -3 base installed 
#1660147040
comm -1 base installed 
#1660147049
comm -12 base installed 
#1660147059
comm -23 base installed 
#1660147068
comm -13 base installed 
#1660147089
comm -13 base installed |less
#1660147154
comm -13 <(cut -f1 <ubuntu-20.04.4-live-server-amd64.manifest | sort -u) <(apt-mark manual | sort -u)
#1660147215
comm -13 <(cut -f1 < ubuntu-20.04.4-live-server-amd64.manifest | sort -u) <(apt-mark manual | sort -u)
#1660147225
apt-mark manual
#1660147251
clear
#1660147257
apt-mark manual
#1660147267
apt-mark showmanual
#1660147277
comm -13 <(cut -f1 < ubuntu-20.04.4-live-server-amd64.manifest | sort -u) <(apt-mark showmanual | sort -u)
#1660147284
comm -13 <(cut -f1 < ubuntu-20.04.4-live-server-amd64.manifest | sort -u) <(apt-mark showmanual | sort -u)|less
#1660147324
sudo apt install podman
#1660147370
do-release-upgrade 
#1660147403
lsb-release -a
#1660147409
lsb_release -a
#1660147531
curl -s http://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-live-server-amd64.manifest
#1660147577
comm -13 <(curl -s http://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-live-server-amd64.manifest | cut -f1 | sort -u) <(apt-mark showmanual | sort -u)
#1660147602
vi .bash_functions 
#1660148524
tmux
#1660231772
hist
#1660231802
user-installed-pkgs 
#1660231824
vi .bash_functions 
#1660231870
function --help
#1660231924
sudo apt update
#1660231953
pip install yq
#1660231964
. .bashrc 
#1660231969
yq
#1660231978
cat .bashrc 
#1660231984
echo $CUBE_PERSONAL_ACCESS_TOKEN 
#1660231999
la
#1660232017
hist
#1660232039
git init --bare ~/.dotfiles
#1660232061
git config --global init.defaultBranch main
#1660232067
rm -rf .dotfiles/
#1660232070
git init --bare ~/.dotfiles
#1660232136
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#1660232148
cat >> .bash_aliases 
#1660232166
cat .bash_aliases 
#1660232209
dotgit status
#1660232278
ls -R .azure/
#1660232290
ls .azure/
#1660232308
cat .azure/clouds.config 
#1660232335
az cloud set -n AzureCloud 
#1660232342
az login
#1660232360
az account show
#1660232367
cat .azure/clouds.config 
#1660232382
dotgit add .azure/clouds.config 
#1660232389
git status
#1660232397
dotgit
#1660232402
dotgit status
#1660232430
cat .azure/az.json 
#1660232447
cat .azure/azureProfile.json 
#1660232459
cat .azure/azureProfile.json |jq
#1660232496
cat .azure/clouds.config 
#1660232506
az account show
#1660232540
grep -rin AzureUSGovernment .azure/
#1660232559
dotgit status
#1660232578
ls .azure/cliextensions/
#1660232584
ls .azure/cliextensions/account/
#1660232608
ls .azure/commands/
#1660232649
cat .azure/commands/2022-08-11.11-41-46.account_show.1600.log
#1660232677
dotgit status
#1660232684
cat .azure/config 
#1660232724
dotgit status
#1660232758
git add .azure/config 
#1660232762
dotgit add .azure/config 
#1660233198
dotgit add .bash_aliases .bash_functions .bashrc .cvsignore .cvsignore .cvsignore .vimrc
#1660233205
dotgit status
#1660233223
cat .bash_logout 
#1660233239
dotgit .bash_logout 
#1660233242
cat .java/
#1660233248
cat .java/fonts/11.0.15/fcinfo-1-main-7-Ubuntu-20.04-en.properties 
#1660233256
dotgit 
#1660233259
dotgit status
#1660233280
cat .config/gh/config.yml 
#1660233310
cat .config/wslu/triggered_time 
#1660233320
cat .config/wslu/oemcp 
#1660233325
cat .config/wslu/baseexec 
#1660233344
ls .config/gh/
#1660233356
dotgit add .config/gh/
#1660233365
dotgit status
#1660233382
cat .gitconfig 
#1660233391
git add .gitconfig 
#1660233398
ls .local/
#1660233401
ls .local/bin/
#1660233410
ls .local/lib/
#1660233414
ls .local/state/
#1660233418
ls .local/state/gh/
#1660233425
cat .local/state/gh/state.yml 
#1660233443
cat .ssh/
#1660233445
ls .ssh/
#1660233493
touch .ssh/config
#1660233500
git add .ssh/config 
#1660233507
dotgit add .ssh/config 
#1660233523
ls .terraform.d/
#1660233539
cat .tmux.conf 
#1660233561
dotgit add .tmux.conf 
#1660233566
ls .tmuxp/
#1660233578
dotgit add .tmuxp/
#1660233590
ls .vim/
#1660233592
ls .vim/pack/
#1660233594
ls .vim/pack/plugins/
#1660233596
ls .vim/pack/plugins/start/
#1660233609
ls .vim/pack/plugins/start/ctrlp/
#1660233614
la .vim/pack/plugins/start/ctrlp/
#1660233656
dotgit status
#1660233672
cat .yarnrc 
#1660233682
dotgit status
#1660236914
git config 
#1660236917
git config -l
#1660236927
cat .bash_aliases 
#1660236940
cd .dotfiles/
#1660236942
git status
#1660236952
cd -
#1660236963
dotgit status
#1660236986
dotgit config status.showUntrackedFiles no
#1660236999
dotgit status
#1660237024
dotgit status --ignored
#1660237131
__git_complete dotgit __git_main
#1660237154
dotgit status --help
#1660237189
dotgit status --untracked-files
#1660237206
dotgit status -u
#1660237223
dotgit config -l
#1660237243
dotgit config status.showUntrackedFiles yes
#1660237247
dotgit status
#1660237266
vi .dotfiles/config 
#1660237277
dotgit status
#1660237328
git restore --staged .azure/*
#1660237333
dotgit restore --staged .azure/*
#1660237338
git status
#1660237343
dotgit status
#1660237375
dotgit rm --cached .azure/clouds.config 
#1660237386
dotgit status
#1660237394
dotgit rm --cached .azure/config 
#1660237396
dotgit status
#1660237456
dotgit ignore '.bash_history*'
#1660237459
dotgit status
#1660237473
file ._bash_history 
#1660237476
ll
#1660237491
rm ._bash_history 
#1660237495
dotgit status
#1660237511
dotgit add .bash_logout 
#1660237528
cat .gitconfig 
#1660237541
dotgit add .gitconfig 
#1660237545
dotgit add .gitignore 
#1660237551
dotgit status
#1660237577
dotgit add .profile 
#1660237579
dotgit status
#1660237622
git ignore .dotfiles/
#1660237628
dotgit ignore .dotfiles/
#1660237630
dotgit status
#1660237735
dotgit ignore .ssh/ .gnupg/ .terraform.d/ .vim .yarnrc .npm/ .python_history .local/ .cache/
#1660237739
dotgit status
#1660237787
dotgit ignore .java/ .landscape/ .motd_shown .sudo_as_admin_successful .viminfo src/
#1660237789
dotgit status
#1660237813
ls .nvm/
#1660237828
ll .nvm/
#1660237840
dotgit ignore .nvm/
#1660237842
git status
#1660237847
dotgit status
#1660237854
cat .lesshst 
#1660237893
ls
#1660237951
cat > README-dotfiles.md
#1660237991
vi README-dotfiles.md 
#1660238208
dotgit add .gitignore 
#1660238215
dotgit status
#1660238225
vi README-dotfiles.md 
#1660238269
git add README-dotfiles.md 
#1660238276
dotgit add README-dotfiles.md 
#1660238295
dotgit status
#1660238346
dotgit commit -m'initial commit, see `README-dotfiles.md`'
#1660238454
dotgit remote add origin git@github.com:sandman-battelle/dotfiles.git
#1660238483
dotgit push -u origin main
#1660238615
dotgit mv README-dotfiles.md .git/README.md
#1660238635
mv README-dotfiles.md .dotfiles/.git/README.md
#1660238662
dotgit mv README-dotfiles.md .github/README.md
#1660238671
mkdir .github
#1660238674
dotgit mv README-dotfiles.md .github/README.md
#1660238682
dotgit status
#1660238687
ls
#1660238747
dotgit commit -m'move README into `.github` to not clutter `$HOME`'
#1660238752
dotgit push
#1660238780
vi .github/README.md 
#1660238863
dotgit add .github/README.md 
#1660238896
dotgit commit -m'touch-up README'
#1660238900
dotgit push
#1660238930
vi .github/README.md 
#1660238995
dotgit add .github/README.md 
#1660238998
dotgit commit -m'touch-up README'
#1660239002
dotgit push
#1660241560
la
#1660241646
vi .bash_functions 
#1660242032
tmux
#1660243031
ls
#1660243041
dotgit status
#1660243049
dotgit diff
#1660243108
__git_complete dotgit __git_main
#1660243129
git status
#1660243133
dotgit status
#1660243215
dotgit ignore .config/wslu/ .lesshst .azure/
#1660243223
rm base installed ubuntu-20.04.4-live-server-amd64.manifest 
#1660243228
dotgit status
#1660243236
dotgit add .
#1660243288
dotgit commit -m'add directory override function stubs'
#1660243291
git push
#1660243296
dotgit push
#1660318566
sudo apt update
#1660318578
sudo apt dist-upgrade 
#1660318648
apt show podman-toolbox 
#1660318704
apt show podman-docker 
#1660318814
apt show podman-toolbox 
#1660318844
sudo apt install podman-toolbox podman-docker 
#1660318933
apt show containers-storage
#1660331325
cd src/cube-env
#1660331337
tmux
#1660662691
cat .bashrc
#1660662700
yq
#1660662716
cat .bashrc
#1660662789
cat >> .bashrc
#1660662805
tmux
#1660662836
. .bashrc
#1660662857
cat .bashrc
#1660662893
vi .bashrc
#1660662974
tmux
#1660663002
eche $CUBE_PERSONAL_ACCESS_TOKEN 
#1660663007
echo $CUBE_PERSONAL_ACCESS_TOKEN 
#1660663014
. .bashrc
#1660663017
echo $CUBE_PERSONAL_ACCESS_TOKEN 
#1660663044
vi .bashrc
#1660663056
la
#1660663073
rm .bashrc.swp 
#1660663077
vi .bashrc 
#1660663198
dotgit status
#1660663204
dotgit diff
#1660663216
dotgit add .
#1660663235
dotgit commit -m'tabs and tokens'
#1660663242
dotgit push
#1660663251
cd src/cube-env
#1660663253
vi
git status
git diff
git diff
git status
rm test1 
git add .
#1660663323
tmux
#1660757174
cd src/cube-platform/
#1660757180
git status
#1660757182
git fetch
#1660757188
git tag
#1660757202
git checkout v0.4.0 
#1660757204
git log
#1660757216
git checkout main
#1660757219
git pull
#1660757234
git submodule update --init --recursive 
#1660757275
rm -r modules/*
#1660757277
git submodule update --init --recursive 
#1660757285
git status
#1660757287
git log
#1660757305
tmux
#1661180921
ls
#1661180929
cd src/
#1661180929
ls
#1661180943
ls -1 |wc -l
#1661205908
cd cube-env
#1661205910
git status
#1661205922
ls
#1661205935
git status --ignored
#1661205954
git status --untracked-files 
#1661205964
rm autom4te.cache/ -r
#1661205966
git status
#1661205995
git fetch
#1661205998
git pull
#1661206004
git diff origin/main 
#1661206043
ls
#1661206092
hist
#1661206102
history 
#1661206123
cat ~/.bash_functions
#1661206162
dotgit status
#1661206186
rm ~/ConditionalAccessDocumentation.csv ~/Invoke-ConditionalAccessDocumentation.ps1 
#1661206188
dotgit status
#1661206196
dotgit fetch
#1661206202
dotgit branch
#1661207826
cat ~/.bashrc 
#1661207867
ls
#1661207890
touch src/cube-env.sh
#1661207891
vi
#1661209698
tmux
#1661355848
cd src/subnet/
#1661356707
podman machine init 
#1661357248
nvm --version
#1661357261
npm --version
#1661357269
node --version
#1661357290
nvm install --lts
#1661357302
nvm install-latest-npm 
#1661357312
npm --version
#1661357341
npm -g -i instant-markdown-d
#1661357374
npm i -g instant-markdown-d
#1661357418
instant-markdown-d --version
#1661357976
cd
#1661358184
ls .vim/pack/plugins/start/instant-markdown/
#1661358192
cd .vim/pack/plugins/start/instant-markdown/
#1661358194
ls
#1661358203
git remote -v
#1661358221
hist|grep instant
#1661358237
vi
#1661358597
cat ~/.vimrc 
#1661358649
vi
#1661359040
cat ~/.vimrc 
#1661391159
yq -h
#1661391771
curl https://objects.githubusercontent.com/github-production-release-asset-2e65be/109145553/279e6a54-f77c-4536-8030-57d5bfa829d9?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220825%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220825T014156Z&X-Amz-Expires=300&X-Amz-Signature=55518198544db71da691d4ba09134eb0a7753042ea59a2283dc48db1fd41e860&X-Amz-SignedHeaders=host&actor_id=78104304&key_id=0&repo_id=109145553&response-content-disposition=attachment%3B%20filename%3Dpodman-v4.2.0.msi&response-content-type=application%2Foctet-stream
#1661391799
curl https://github.com/containers/podman/releases/download/v4.2.0/podman-v4.2.0.msi
#1661391812
curl -L https://github.com/containers/podman/releases/download/v4.2.0/podman-v4.2.0.msi
#1661391835
curl -L https://github.com/containers/podman/releases/download/v4.2.0/podman-v4.2.0.msi --output podman-v4.2.0.msi
#1661391838
ls
#1661391842
file podman-v4.2.0.msi 
#1661392081
podman machine init
#1661392091
qemu
#1661392101
sudo apt update
#1661392120
sudo apt dist-upgrade 
#1661392405
podman run hello-world
#1661392603
apt show docker.io
#1661393954
curl -L -O "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
#1661393955
chmod +x install.sh
#1661393955
sudo ./install.sh install
#1661393995
/opt/distrod/bin/distrod enable --start-on-windows-boot
#1661394004
sudo /opt/distrod/bin/distrod enable --start-on-windows-boot
#1661394198
pstree
#1661454627
hist
#1661454648
sudo apt install docker.io
#1661454658
sudo apt update
#1661454668
sudo apt dist-upgrade 
#1661454699
apt show nftables
#1661454815
sudo apt install docker.io
#1661454863
docker ps
#1661454902
id
#1661454910
sudo add user sandman docker
#1661454916
sudo adduser sandman docker
#1661454938
id
#1661454947
docker ps
#1661454975
sudo systemctl restart docker.service 
#1661454990
journalctl -xeu docker.service
#1661455330
sudo reboot
#1661455352
docker ps
#1661455362
journalctl -xeu docker.service
#1661455561
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
#1661455564
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
#1661455576
iptable --help
#1661455582
iptables --help
#1661455600
command -V iptables
#1661455615
readlink -f $(command -V iptables)
#1661455631
ls
#1661455650
command -V iptables
#1661455666
readlink -f /usr/sbin/iptables
#1661455679
sudo systemctl restart docker.service 
#1661455684
journalctl -xeu docker.service
#1661455691
docker ps
#1661455999
hist
#1661529537
cd src/subnet/
#1661529540
cat .cuberc 
#1661529547
vi .cuberc 
#1661531258
. .cuberc 
#1661531277
echo ${MODULES[1]}
#1661531282
echo ${MODULES[0]}
#1661531289
vi .cuberc 
#1661531307
. .cuberc 
#1661531309
echo ${MODULES[0]}
#1661531313
echo ${MODULES[1]}
#1661531363
eval "${MODULES[1]}"
#1661531367
echo $vdi
#1661531383
eval "${MODULES[0]}"
#1661531389
echo $core
#1661531406
eval "subnet_${MODULES[0]}"
#1661531414
echo $subnet_core 
#1661531429
hist
#1661531449
vi .cuberc 
#1661531702
cd src/subnet/
#1661531716
vi .cuberc 
#1661531931
. .cuberc 
#1661531938
vi .cuberc 
#1661531991
. .cuberc 
#1661531999
vi .cuberc 
#1661532299
. .cuberc 
#1661532307
echo $subnet_core 
#1661532314
echo $subnet_vdi
#1661532321
vi .cuberc 
#1661532381
. .cuberc 
#1661532410
vi .cuberc 
#1661532445
. .cuberc 
#1661532499
vi .cuberc 
#1661532509
. .cuberc 
#1661532513
vi .cuberc 
#1661532520
set +x
#1661532523
. .cuberc 
#1661532539
printenv |grep subnet
#1661532555
vi .cuberc 
#1661532569
. .cuberc 
#1661532574
printenv |grep subnet
#1661532595
echo $subnet_core 
#1661532599
echo $subnet_vdi 
#1661532609
printenv 
#1661532628
unset NAME 
#1661532630
printenv 
#1661532638
. .cuberc 
#1661532639
printenv 
#1661532674
vi .cuberc 
#1661532692
. .cuberc 
#1661532697
printenv 
#1661532717
vi .cuberc 
#1661533284
tmux
#1661869554
ls
#1661871730
alias
#1661871839
cube-log 
#1661872755
ls
#1661872760
cat install.sh 
#1661872765
ls
#1661872769
cd src/
#1661872770
ls
#1661872776
cd cube-env
#1661872778
ls
#1661872781
git status
#1661872795
vi ~/.vimrc 
#1661872845
tmux
#1661876523
az login
#1661876539
hist
#1661876545
az ad sp list
#1661876620
az ad sp credential list --id 14a2eec7-236e-458f-a901-5e2c38f085f1
#1661876650
az ad sp credential list --id 5bb3f37c-4827-4fb8-8d07-567b1926f13c
#1661876677
az ad sp credential list --id gold-wookie-sandman
#1661876716
az ad app show gold-wookie-sandman
#1661876726
az ad app show --id gold-wookie-sandman
#1661876745
az ad app show 14a2eec7-236e-458f-a901-5e2c38f085f1
#1661876754
az ad app show --id 14a2eec7-236e-458f-a901-5e2c38f085f1
#1661876761
az ad sp credential list --id gold-wookie-sandman
#1661876766
az ad sp list
#1661876791
az ad sp credential list --id 5bb3f37c-4827-4fb8-8d07-567b1926f13c
#1661876838
az ad sp credential list --id 5f2598b3-1805-40b5-aaea-4f1fe15e031e
#1661877048
az ad app credential list --id 5bb3f37c-4827-4fb8-8d07-567b1926f13c
#1661877163
az ad app credential reset --id 5bb3f37c-4827-4fb8-8d07-567b1926f13c --append
#1661889239
foo=bar
#1661889244
(echo $foo)
#1661889272
sh -c 'echo $foo'
#1661889279
export foo=bar
#1661889281
sh -c 'echo $foo'
#1661956525
ls src/
#1661956731
build/libexec/cube-env-hook --help
#1661956743
. build/libexec/cube-env-hook --help
#1661956765
. build/bin/cube-env-setup --help
#1661956815
sudo apt update
#1661956831
sudo apt dist-upgrade 
#1661956869
sudo systemctl restart docker.service 
#1661956888
docker ps
#1661956892
docker ps -a
#1661959719
bashdb
#1661959895
ddd
#1661959902
sudo apt install ddd
#1661959936
ddd
#1661960024
cd src/
#1661960027
gh repo clone ko1nksm/getoptions
#1661960035
cd getoptions/
#1661960036
ls
#1661960043
make
#1661960046
git status
#1661960047
ls
#1661960050
ls bin/
#1661960055
ls lib/
#1661960062
git status --ignored
#1661960223
ls lib/
#1661960245
cd ../cube-env
#1661960246
ls
#1661960249
ls lib/
#1661960263
git submodule deinit lib/optparse/
#1661960272
git status
#1661960286
git restore --staged lib/optparse/
#1661960291
git submodule deinit lib/optparse/
#1661960298
git submodule deinit lib/optparse
#1661960302
ls
#1661960307
la
#1661960312
cat .gitmodules 
#1661960327
rm .gitmodules 
#1661960353
rm -r .git/modules/lib/
#1661960357
rm -r .git/modules/lib/ -f
#1661960361
git status
#1661960369
rm -rf lib/optparse/
#1661960423
git submodule add https://github.com/ko1nksm/getoptions lib/getoptions
#1661960433
touch .gitmodules
#1661960434
git submodule add https://github.com/ko1nksm/getoptions lib/getoptions
#1661960439
git status
#1661960452
ls lib/getoptions/
#1661960465
tmux
#1662466923
sudo snap install yq
#1662466978
tmux
#1662665561
hist
#1662665569
printenv |grep core
#1662665582
cd src/subnet/
#1662665593
cd
#1662665596
vi .bashrc 
#1662665628
cat src/subnet/.cuberc 
#1662665648
view src/cube-env/build/libexec/cube-env-hook 
#1662665669
cat .bashrc 
#1662665681
source /home/sandman/src/cube-env/build/libexec/cube-env-hook
#1662665690
cd src/subnet/
#1662665714
printenv |grep core
#1662665725
cd ../test-cube-1/
#1662665728
printenv |grep core
#1662665742
printenv |grep testcube1
#1662665755
version
#1662665757
usage
#1662665793
cd ../cube-env
#1662665794
ls
#1662665797
tmux
#1662730063
view /etc/profile
#1662730145
sudo mv /etc/profile.d/cube-env-hook{,.sh} 
#1662730151
tmux
#1663613553
tmux ls
#1663613571
tmux attach 0
#1663613585
tmux attach-session 0
#1663613596
tmux attach-session -t 0
#1663613637
tmux ls
#1663613641
tmux attach-session -t 2
#1663613670
tmux attach-session -t 5
#1663680527
cd src/q-b-mccubeface/
#1663680528
ls
#1663680538
git status
#1663680540
git log
#1663682423
git status
#1663682428
git fetch
#1663682442
git pull --recurse-submodules 
#1663682452
git log
#1663682483
tmux
#1663779053
cd src/
#1663779054
ls
#1663779065
rm cube-env_0.1.0-alpha.4*
#1663779066
ls
#1663779070
cd cube-env
#1663779071
ls
#1663779090
git status --ignored
#1663779095
git checkout main
#1663779097
git status
#1663779099
git status --ignored
#1663779101
ls
#1663779106
ls -R
#1663779125
ll
#1663779176
rm NEWS.md 
#1663779178
ls
#1663779179
ll
#1663779265
tmux
#1664196306
find src/ -type f -name '.*.swp'
#1664196319
tmux ls
#1664196327
tmux attach
#1665080402
tmux ls
#1665080417
tmux
#1666111656
cd src/cube-program/
#1666111660
git fetch
#1666111676
git status
#1666111731
git merge gaunt-battelle-patch-1 
#1666111736
git log
#1666111776
git checkout gaunt-battelle-patch-1 
#1666111787
git merge origin/gaunt-battelle-patch-1 
#1666111806
git log
#1666111813
git push
#1666111823
git fetch
#1666111837
git status
#1666111848
git checkout main
#1666111852
git merge origin/gaunt-battelle-patch-1 
#1666111858
git log
#1666111862
git push
#1666112108
git submodule list
#1666112113
git submodule --list
#1666112120
git submodule status
#1666112139
git submodule status --verbose
#1666112145
git submodule status --help
#1666112157
cd modules/
#1666112158
ls
#1666112220
cdroot 
#1666112234
git submodule deinit modules/arena-sideload/
#1666112253
git submodule deinit modules/cube-cli/
#1666112267
git submodule deinit modules/cube-firewall/
#1666112272
git submodule deinit modules/cube-inventory/
#1666112288
git submodule deinit modules/cube-machine-windows/
#1666112297
git submodule deinit modules/cube-network/
#1666112305
git submodule deinit modules/cube-o365-group/
#1666112314
git submodule deinit modules/cube-security/
#1666112332
git submodule deinit modules/cube-vdi/
#1666112346
git submodule deinit modules/environment-init/
#1666112352
git submodule deinit modules/storage-account/
#1666112359
git submodule deinit modules/subnet/
#1666112392
git submodule --list
#1666112401
git submodule status
#1666112425
ls -1 modules/
#1666112446
ls
#1666112451
ls bin/
#1666112485
ls -1 modules/ |xarg git submodule deinit
#1666112490
ls -1 modules/ |xargs git submodule deinit
#1666112525
ls -1 modules/ | while read m; do git submodule deinit modules/$m
#1666112529
ls -1 modules/ | while read m; do git submodule deinit modules/$m; done
#1666112576
git status
#1666112759
ls modules/subnet/
#1666112762
ls modules/subnet/ -a
#1666112825
git submodule status
#1666112834
vi .gitmodules 
#1666112880
ls .git/modules/
#1666112896
ls .git/modules/modules/subnet/
#1666112909
cat .git/modules/modules/subnet/ORIG_HEAD 
#1666112926
grep -r battelle-cube .git/modules/modules/subnet/
#1666112984
ls .git/modules/
#1666112987
ls .git/modules/content/
#1666112990
ls .git/modules/content/reference/
#1666112992
ls .git/modules/content/reference/modules/
#1666112994
ls .git/modules/content/reference/modules/cube-cli/
#1666113019
rm -r .git/modules/
#1666113022
rm -r .git/modules/ -f
#1666113025
git status
#1666113052
git submodule update --init --recursive 
#1666113125
vi .gitmodules 
#1666113170
git submodule update --init --recursive 
#1666113187
rm -r .git/modules/ -f
#1666113199
rm -rf modules/*
#1666113204
git submodule update --init --recursive 
#1666113212
vi .gitmodules 
#1666113224
ls modules/
#1666113273
cd ..
#1666113281
rm -rf cube-program/
#1666113293
gh repo clone battellecube/cube-program
#1666113300
gh auth login
#1666113352
gh repo clone battellecube/cube-program
#1666113368
cd cube-program/
#1666113369
ls
#1666113371
ls modules/
#1666113377
ls modules/cube-cli/
#1666113383
git submodule update --init --recursive 
#1666113406
ls modules/cube-cli/
#1666113411
ls -1 modules/ | while read m; do git submodule deinit modules/$m; done
#1666113415
ls modules/cube-cli/
#1666113420
vi .gitmodules 
#1666113455
git submodule update --init --recursive 
#1666113476
ls .git
#1666113481
ls .git/modules/
#1666113483
ls .git/modules/modules/
#1666113502
rm -rf .git/modules/modules/environment-init/
#1666113508
rm -rf .git/modules/modules/cube-firewall/
#1666113512
git submodule update --init --recursive 
#1666113535
cd ..
#1666113543
rm -rf cube-program/
#1666113546
gh repo clone battellecube/cube-program
#1666113559
cd cube-program/
#1666113562
ls .git/
#1666113572
cat .gitmodules 
#1666113579
vi .gitmodules 
#1666113603
git submodule update --init --recursive 
#1666113614
git status
#1666113621
git restore .gitmodules
#1666113623
git status
#1666113644
git submodule deinit modules/environment-init/
#1666113656
cd ..
#1666113659
rm -rf cube-program/
#1666113662
gh repo clone battellecube/cube-program
#1666113676
cd cube-program/
#1666113683
git submodule deinit modules/environment-init/
#1666113711
ls .git/
#1666113731
vi
#1666113741
vi .gitmodules 
#1666113749
git submodule update --init --recursive 
#1666113766
ls modules/
#1666113769
ls modules/arena-sideload/
#1666113786
vi .gitmodules 
#1666113825
ls modules/arena-sideload/
#1666113827
ls modules/arena-sideload/ -a
#1666113836
ls modules/environment-init/ -a
#1666113847
ls modules/*
#1666113851
ls modules/* -a
#1666113868
rm modules/environment-init/ -r
#1666113876
rm modules/cube-firewall/
#1666113879
rm modules/cube-firewall/ -r
#1666121407
hist
#1666121477
git submodule update --init --recursive 
#1666121527
git submodule update --init
#1666121534
cd ..
#1666121539
rm -r cube-program/
#1666121543
rm -r cube-program/ -f
#1666121547
gh repo clone battellecube/cube-program
#1666121563
cd cube-program/
#1666121566
ls modules/
#1666121572
ls modules/ -R
#1666121575
ls modules/ -Ra
#1666121602
grep -r arena-sideload .
#1666121640
vi .gitmodules 
#1666121697
git submodule update --init
#1666121746
grep -r cube-firewall .
#1666121759
view .git/index 
#1666121773
rm .git/index 
#1666121776
git submodule update --init
#1666121781
ls modules/
#1666121786
ls modules/ * -a
#1666121799
ls modules/*
#1666121802
ls modules/* -a
#1666121880
cd ..
#1666121940
gh repo clone battellecube/cube-program
#1666121948
rm -rf cube-program/
#1666121951
gh repo clone battellecube/cube-program
#1666121963
cd cube-program/
#1666121964
ls
#1666121982
vi .gitmodules 
#1666122003
vi .git/config 
#1666122038
git rm -cached modules/cube-firewall/
#1666122049
git rm --cached modules/cube-firewall/
#1666122052
git status
#1666122065
git add .
#1666122069
git rm --cached modules/cube-firewall/
#1666122078
git rm --cached modules/environment-init/
#1666122080
git status
#1666122110
git commit -m'remove cube-firewal and environment-init modules'
#1666122121
git status
#1666122136
git submodule update --init --recursive 
#1666122154
git status
#1666122157
git log
#1666122163
git push
#1666122236
cd content/
#1666122236
ls
#1666122239
cd terraform-modules/
#1666122240
ls
#1666122245
rm cube-firewall.md 
#1666122248
rm environment-init.md 
#1666122250
cd ..
#1666122255
cdroot 
#1666122257
git status
#1666122259
git add .
#1666122272
git status
#1666122292
git commit -m'cleaned symlinks to removed modules'
#1666122294
git push
#1666122402
vi
#1666122731
bin/find-missing-modules 
#1666122804
cd content/terraform-modules/
#1666122806
ll
#1666122968
bin/find-missing-modules 
#1666122975
cdroot 
#1666122977
bin/find-missing-modules 
#1666122993
cat bin/find-missing-modules 
#1666123137
gh repo list battelle-cube       --limit 1000       --topic module       --json name --jq '.[].name' |     sort
#1666192579
hist
#1666193242
bin/find-missing-modules 
#1666193258
mktemp -h
#1666193263
mktemp --help
#1666193284
vi 
#1666193342
bin/find-missing-modules 
#1666193363
cat /tmp/tmp.GZoeq8wfJ1
#1666193374
cat /tmp/tmp.Tn1gnqSdiH
#1666193388
vi
#1666193410
bin/find-missing-modules 
#1666193439
git status
#1666193460
git checkout -b add-missing-modules
#1666193465
bin/find-missing-modules |     while read mod; do         git submodule add git@github.com:battelle-cube/$mod modules/$mod;     done
#1666193474
vi
#1666193505
bin/find-missing-modules 
#1666193517
bin/find-missing-modules |     while read mod; do         git submodule add git@github.com:battellecube/$mod modules/$mod;     done
#1666193549
bin/find-missing-modules 
#1666193577
vi
#1666193606
bin/find-missing-modules |     while read mod; do         git submodule add git@github.com:battellecube/$mod modules/$mod;     done
#1666193624
bin/find-missing-modules |     while read mod; do         echo git submodule add git@github.com:battellecube/$mod modules/$mod;     done
#1666193654
vi
#1666193678
bin/find-missing-modules 
#1666193692
git tsatus
#1666193694
git status
#1666193703
git add .
#1666193717
git commit -m'add missing CUBE modules to docs'
#1666193720
git fetch
#1666193769
git push -u origin add-missing-modules 
#1666194021
git checkout main
#1666194030
git pull
#1666194045
git merge add-missing-modules 
#1666194053
git push
#1666194169
cd content/
#1666194170
ls
#1666194173
cd terraform-modules/
#1666194174
ls
#1666194176
ll
#1666194193
cd ../..
#1666194208
tmux
#1666194216
tmux ls
#1666194219
tmux
#1666275355
cd src/
#1666275372
gh repo clone battellecube/seceng
#1666275382
cd seceng/
#1666275385
git satuts
#1666275387
git status
#1666275418
../cube-cli/bin/set-local-env --help
#1666275471
../cube-cli/bin/set-local-env -e mcneilj -a 10.237.103.0/24 -p cube-platform-v0.5.0
#1666275482
az login -t battelle.us
#1666275493
../cube-cli/bin/set-local-env -e mcneilj -a 10.237.103.0/24 -p cube-platform-v0.5.0
#1666275513
az account set -s seceng-secops 
#1666275515
../cube-cli/bin/set-local-env -e mcneilj -a 10.237.103.0/24 -p cube-platform-v0.5.0
#1666275532
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d mcneilj
#1666275553
cd ../cube-cli/
#1666275554
ls
#1666275569
bin/cube-cli-download 
#1666275579
sudo install cube-linux-86_64 /usr/local/bin/cube
#1666275585
cd -
#1666275591
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d mcneilj
#1666275737
az logout
#1666275751
az login -t battelle.us
#1666275759
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d mcneilj
#1666276004
gh auth login
#1666276161
export CUBE_PERSONAL_ACCESS_TOKEN=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
#1666276165
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d mcneilj
#1666276249
cube env create --help
#1666276270
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d -n seceng mcneilj
#1666276506
git remote -v
#1666276540
cube --version
#1666276547
cube env create --help
#1666276562
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d -n seceng -o battellecube mcneilj
#1666276651
az login -t battelle.us
#1666276716
../cube-cli/bin/set-local-env -e mcneilj -a 10.237.103.0/24 -p cube-platform-v0.5.0
#1666277024
cube-log
#1666277049
curl -s -w '\n%{http_code}' -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $CUBE_PERSONAL_ACCESS_TOKEN" -H "Content-Type: application/json" https://api.github.com/repos/battellecube/seceng/environments/mcneilj
#1666277148
cube env create --tenant 215220de-12d7-408e-b764-7e998342ac42 --subscription-id 80920ed2-0a36-4cb1-9907-329ea674e58d -n seceng -o battellecube mcneilj
#1666285951
git status
#1666285974
git clear 
#1666285979
git status
#1666285983
git fetch
#1666286003
cd ..
#1666286005
tmux
#1666638437
tar -cf secrets.tar .ssh/ .gnupg/ .config/gh/hosts.yml 
#1666638448
tar -tf secrets.tar 
#1666639380
hist
#1666707275
la
#1666707281
ls .vim
#1666707292
dotgit status --ignored
#1666707315
vi .gitignore 
#1666707361
dotgit status
#1666707369
rm secrets.tar 
#1666707372
dotgit status
#1666707402
hist
strip --help
ls /mnt/c/Users/SandmanMike\(US\)/
ls /mnt/c/Users/SandmanMike\(US\)/OneDrive\ -\ Battelle/
tar -xf /mnt/c/Users/SandmanMike\(US\)/OneDrive\ -\ Battelle/secrets.tar 
la
gpg --list-key
git
git clone --bare git@github.com:<your_username>/dotfiles ~/.dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotgit checkout -f
git clone --bare git@github.com:sandman-battelle/dotfiles ~/.dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotgit checkout -f
dotgit status
ls
la
ls .local/bin
la
mkdir ./local/bin -p
vi ./local/bin/bootstrap-cube-env
tmux
ls
ls local/
ls local/bin/
mv local/bin/bootstrap-cube-env ./local/bin/
ls
la
ll ./local/bin/bootstrap-cube-env 
ll local/bin/bootstrap-cube-env 
vi ./local/bin/bootstrap-cube-env 
tmux
#1667916660
ls
#1667916665
sudo apt update
#1667916715
cd src
#1667916717
ls
#1667916728
la
#1667916748
hist
#1667917495
vi .local/bin/bootstrap-cube-env 
#1667917521
tmux
#1667918830
vi
#1667918848
ls /.vim
#1667918857
ls .vim
#1667918860
la
#1667918878
vi .local/bin/bootstrap-cube-env 
#1667918910
bootstrap-cube-env 
#1667918959
tmux
#1667919813
vi
#1667919839
vi .local/bin/bootstrap-cube-env 
