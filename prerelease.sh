current_date=$(date +"%Y-%m-%d_%H:%M:%S")
branch=$(git symbolic-ref --short HEAD)

rm -rf docs && npm run build && cp -r dist docs && git add . && git commit -m "$branch_$current_date" && git push origin $branch