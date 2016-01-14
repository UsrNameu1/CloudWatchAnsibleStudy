require 'rake'

BUILD_ROOT_PATH = 'build'

namespace :play do

  desc "prepare for build"
  task :prepare do
    prepare
  end

  desc "checkout from repository"
  task :checkout => :prepare do
    target_branch = ENV['TARGET_BRANCH'] || 'master'
    checkout target_branch
  end

  desc "build for release"
  task :build => :checkout do
    build
  end
end

def prepare
  Dir.mkdir BUILD_ROOT_PATH unless Dir.exists? BUILD_ROOT_PATH
end

def checkout branch
  project_root_path = create_project_root_path
  repository_url = create_repo_url
  checkout_project project_root_path, repository_url, branch
end

def checkout_project project_root_path, repo_url, branch
  if Dir.exists? project_root_path
    Dir.chdir project_root_path do
      sh "git fetch"
      sh "git checkout #{branch}"
      sh "git pull"
    end
  elsif
  sh "git clone -b #{branch} #{repo_url} #{project_root_path}"
  end
end

def build
  project_root_path = create_project_root_path

  Dir.chdir project_root_path do
    sh "./activator clean stage"
  end
end

def create_project_root_path
  "#{BUILD_ROOT_PATH}/CloudWatchLogSample"
end

def create_repo_url
  "git@github.yad:UsrNameu1/CloudWatchLogSample.git"
end
