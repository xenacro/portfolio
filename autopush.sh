current_date=$(date +"%Y-%m-%d_%H:%M:%S")
branch=$(git symbolic-ref --short HEAD)

git add . && git commit -m "$branch:$current_date" && git push origin $branch