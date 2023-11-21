# A (very) quick introduction to GitHub Actions

**Author:** Oscar Mojica, Supercomputing Center for Industrial Innovation, Senai Cimatec

In this tutorial we will introduce Github Actions as a tool for lightweight automation of scientific data workflows. While GitHub Actions have become integral to the software development lifecycle, many scientific programmers, 
especially those not extensively engaged in software deployment, might not be well-acquainted with their features or understand their potential within data pipelines. Using straightforward examples, we aim to showcase how GitHub 
Actions can be applied to automate various data processing tasks. Our objective is to empower participants to envision and implement their own strategies for integrating GitHub Actions into their work processes.

**Prerequisites:** GitHub account, basic familiarity with git, Github, and version control, programming in Interpreted/Compiled Programming Languages.

**Audience:** scientific programmers interested in automating components of their workflows through existing tools for software continuous integration/deployment.

## GitHub Actions Introduction
* [Github actions documentation](https://docs.github.com/en/actions/learn-github-actions/introduction-to-github-actions)

## Setup 
* Fork this repo
* Enable Github Actions:
  * Settings ->   Actions -> Allow actions and reusable workflows
  * [Managing Permissions Documentation](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#managing-github-actions-permissions-for-your-repository) 

# GitHub Actions Python Environment Workflow
First, we will run a basic workflow which creates a python environment with a few scientific packages and prints out their version
* [.github/workflows/python_env.yml](https://github.com/ofmla/githubactions_intro/blob/main/.github/workflows/python_env.yml)
* go to **Actions** tab, click on **Python Environment**, and click **Run workflow**: this will manually trigger the workflow ([`dispatch_workflow`](https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow))
* click on the newly created run to see the execution progress

## License

These materials are for a course intended to provide a (very) quick introduction to GitHub Actions. The course is aimed at a scientific audience. Comments, corrections, and additions are welcome.

All source code is made available under the MIT license.

The full text of these licenses is provided in the [LICENSE](https://github.com/ofmla/githubactions_intro/blob/main/LICENSE) file.
