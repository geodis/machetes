git config --global user.name "pepe"
git config --global user.email "pepe@pipi.com"
git config --list

git init .
git status
# agrego todos
git add -A
#  quito file del add
git rm --cached <file>
git commit -m "mensaje"
# historial de commits
git log
# clono un repo
git clone
git diff
# del repo
git pull origin master
git push origin master

# workflow
# ----------

# branches

git branch mi_nueva_feature
git checkout mi_nueva_feature
# listar branches
git branch
git branch -a

git push -u origin mi_nueva_feature

# uno branch con master
git checkout master
git pull
git branch --merged
git merfe mi_nueva_feature
git push origin master

# Borro branch que ya no uso
git push origin --delete mi_nueva_feature
# borro en el local
git branch -d mi_nueva_feature



------------------
status
------------------
git status -s 

 M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt

# Columna izq: status of the staging area
# Columna der: status of the working tree
# ?? --> untracked
# A  --> added to staging area
# M  --> Modified

------------------
diff
------------------
# If you want to see what you’ve staged that will go into your next commit,
git diff --staged
git diff --cached
git rm --cached README

------------------
log
------------------
# -p or --patch, which shows the difference (the patch output) 
# introduced in each commit. You can also limit the number of 
# log entries displayed, such as using -2 to show only the 
# last two entries.
git log -p -2
# to see some abbreviated stats
git log --stat
git log --since=2.weeks
# when you may want to undo something
git commit --amend
$ git commit -m 'Initial commit'
$ git add forgotten_file
$ git commit --amend
# Unstaging a Staged File
git reset HEAD CONTRIBUTING.md
# Unmodifying a Modified File
git checkout -- CONTRIBUTING.md
------------------
remotes
------------------

------------------
Undo mistakes
------------------
# luego de un git diff quiero restaurar un file
git restore index.html
# restore deleted file
git restore index.html
# Si en el diff hice varios cambios, pero solo quiero restaurar
# algunos y no todos
git restore index.html -p # va a ir preguntando bloque por bloque (chunk)
# restore to the last commit
git restore . # everything in this folder will be undone
# Si quiero hacer un undo de un commit en especifico: 2b504bee
git revert 2b504bee # me va a deshacer los cambios que hizo en ese commit en un nuevo commit
# volver en el tiempo, volver a un commit y borrar todo lo que vino despues. Reset
git reset --hard 2b504bee # vuelvo a este tiempo --hard: no local changes will survive
git reset --mixed 2b504bee # vuelvo a este tiempo --mixed: no borro en el local los cambios
