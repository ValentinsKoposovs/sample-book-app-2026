pipeline {
    agent any

     triggers { pollSCM('*/1 * * * *') }

    stages {
        stage('build-install-deps') {
            steps {
                script {
                    build()
                }
            }
        }

        stage('deploy-dev') {
            steps {
                script {
                    deploy("DEV", 4000)
                }
            }
        }
        stage('test-dev') {
            steps {
                script {
                    test("DEV")
                }
            }
        }

        stage('deploy-stg') {
            steps {
                script {
                    deploy("STG", 4001)
                }
            }
        }
        stage('test-stg') {
            steps {
                script {
                    test("STG")
                }
            }
        }

        stage('deploy-prd') {
            steps {
                script {
                    deploy("PRD", 4002)
                }
            }
        }
        stage('test-prd') {
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
    // bat "node_modules\\.bin\\pm2 startup"
    echo "Done installing"
}

def deploy(String environment, int port)
{
    echo "Deployment to ${environment} environment has started.."
    // bat ".\\node_modules\\.bin\\pm2 start -n \"books-${environment}\" index.js -- -- ${port}"
    // bat ".\\node_modules\\.bin\\pm2 delete \"books-${environment}\" || exit 0
    bat "node_modules\\.bin\\pm2.cmd start -n \"books-${environment}\" index.js -- -- ${port}"
    echo "Deployment to ${environment} environment has finished"
}

def test(String environment)
{
    echo "Testing Sample Book Application service has started on ${environment} environment.."
    git branch: 'main', poll: false, url: 'https://github.com/ValentinsKoposovs/RTU-sample-API-automation-2026.git'
    echo "Testing Sample Book Application service finished"
}
