This is the source of my personal website. 

I use jekyll-scholar to organize my publications. Since Github Pages do not support the plugin, I follow the [instructions](https://github.com/randymorris/randymorris.github.com) and create two branches for publishing website. The source branch tracks all information (including plugins and configurations) about the site, while the master branch only keeps `_site/`. In the following, I forward the detailed instructions. 

> - Make changes in the source branch
> - Build and test the site locally
> - Commit changes to source branch
> - git publish-website which consists of the following steps
>	- git branch -D master
>	- git checkout -b master
>	- git filter-branch --subdirectory-filter _site/ -f
>	- git checkout source
>	- git push --all origin

For the last step of `git push --all origin`, I need to add an option of `-f` to force push in my case.

Recently, jekyll does not work for me. It reports the error `Cant find gem bundler (>= 0.a) with executable bundle`. I solve the problem following the [direction](https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html) 

- Run `sudo gem update --system`
- Run `bundle update --bundler`
- In my WSL, the default port is occupied by other process. I execute `bundle exec
jekyll serve --watch --port 4444` to use a customized port. I can preview the site in
http://localhost:4444/.

Note that I need to run `JEKYLL_ENV=production bundle exec jekyll build`, in order to generate a
deployable site.  

Sometimes, I face a problem that [my github webpage is not updating after changes are made](https://github.com/orgs/community/discussions/19713). I click unpublish site (in Setting/Pages), select the *none* branch for publishing and save. Then, I re-activate publishing, and choose the *master* branch. Wait for like a few minutes. It will be published again with all the changes. 
