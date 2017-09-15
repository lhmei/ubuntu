from gittle import Gittle

repo_path = '/tmp/gittle_bare'
repo_url = 'https://github.com/yangchen8/gitpython_test.git'

repo = Gittle.clone(repo_url, repo_path)
#repo = Gittle(repo_path)
print((repo.tracked_files))

print(repo.tags)
repo.switch_branch('master')

print((repo.tracked_files))

repo.checkout('refs/tags/v0.1')

print((repo.tracked_files))
