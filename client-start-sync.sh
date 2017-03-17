# initial sync
rsync -avP ./share --delete rsync://localhost:10873/example/

# sync on change
fswatch -0 ./share | xargs -0 -n 1 -I {} rsync -avP ./share --delete rsync://localhost:10873/example/
