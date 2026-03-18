pipeline {
    agent any

     triggers { pollSCM('*/1 * * * *') }

    stages {
        stage('build-install-deps') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    build()
                }
            }
        }

        stage('deploy-dev') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    deploy("DEV", 4000)
                }
            }
        }
        stage('test-dev') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    test("DEV")
                }
            }
        }

        stage('deploy-stg') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    deploy("STG", 4001)
                }
            }
        }
        stage('test-stg') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    test("STG")
                }
            }
        }

        stage('deploy-prd') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    deploy("PRD", 4002)
                }
            }
        }
        stage('test-prd') {
            when {not {changeset "README.md"}}
            steps {
                script {
                    test("PRD")
                }
            }
        }
    }
}

def build() {
    echo "Installing all necessary node dependencies.."
    bat "npm install"
    echo "Done installing"
}

def deploy(String environment, int port)
{
    echo "Deployment to ${environment} environment has started.."
    git branch: 'main', poll: false, url: 'https://github.com/ValentinsKoposovs/sample-book-app-2026.git'
    bat "npm install"
    bat "node_modules\\.bin\\pm2 delete \"books-${environment}\" || exit 0"
    bat "node_modules/.bin/pm2 start -n \"books-${environment}\" index.js -- ${port}"
    echo "Deployment to ${environment} environment has finished"
}

def test(String environment)
{
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    git branch: 'main', poll: false, url: 'https://github.com/ValentinsKoposovs/RTU-sample-API-automation-2026.git'
    bat "npm install"
    bat "npm run books BOOKS_${environment}"
    echo "Testing Sample Book Application service finished"
}