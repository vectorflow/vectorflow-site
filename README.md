# vectorflow-site
This repository has the code for Vectorflow website.

# Deployment steps.

* SSH into the server
* Run the following command to update/install the website.

```bash
deploy.sh
```

* The above command installs `master` branch, if specific branch installation is required run the following command.

```bash
deploy.sh <branch name> # eg. deploy.sh fb/new_website_issue_fixes
```