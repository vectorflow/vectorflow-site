#!/bin/bash

# VectorFlow website deploy script

root_dir="/home/bitnami"
project_name=VectorFlowWebsite
webroot_dir="/opt/bitnami/apache2/htdocs/vectorflow"
project_url=git@github.com:vectorflow/vectorflow-site.git

target_branch=${1:-master}
if [ ! -d "$root_dir/$project_name/repo" ]
then
	echo -e "\e[92mSetting up repo for the first time\e[0m"
	mkdir -p $root_dir/$project_name/repo
	mkdir -p $root_dir/$project_name/public
	git clone --mirror $project_url $root_dir/$project_name/repo
fi

cd "$root_dir/$project_name/repo"

git remote update

last_commit_sha=$(git rev-parse $target_branch)

target_deploy_directory="$root_dir/$project_name/public/$target_branch-$last_commit_sha"

echo -e "\e[92mDeploying $last_commit_sha on $target_branch to $target_deploy_directory\e[0m"
rm -rfv "$target_deploy_directory" &> /dev/null
mkdir -p $target_deploy_directory
git archive $target_branch | tar -x -C "$target_deploy_directory"

echo -e "\e[92mLinking $target_deploy_directory > $root_dir/public/$project_name\e[0m"
mkdir -p "$root_dir/public"
rm -rfv "$webroot_dir" &> /dev/null
ln -s "$target_deploy_directory" "$webroot_dir"

echo -e "\e[92mDone\e[0m"
