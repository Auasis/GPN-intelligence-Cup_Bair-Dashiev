pipeline 
{
	agent any

	environment 
	{
	 PROJECT_NAME = "Участие в чемпинате"
	 OWNER_NAME   = "Bair Dashiev"
	}
	
	options 
	{
	 buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
	 timestamps()
	}
	stages 
	{
	
		stage("1-Build")
		{
			steps 
			{
				echo "${PROJECT_NAME}"
				echo "${OWNER_NAME}"
				echo "==================|| start building image ||================"
				sh ' docker build -t bairs_site .'
				
						
			}	
		}
		stage("2-Test")
		{
			
			steps
			{
				
				echo "=================|| start test ||================"
				sh ' docker run -d -p 8000:80 --name my_con auasis/bairs_site '
				script {
				TESTER = sh( returnStdout : true, script :' docker exec my_con grep "Instagram" /usr/local/apache2/htdocs/index.html | wc -l  ').trim()
				}
				script {
				switch (TESTER) {
					case "0" :
						result = "Test Failed"
						sh "exit 1"
						break
					default :
						result = "Test Passed"
						sh "exit 0"
						break
				}
				}
				echo "${result}"
				sh "docker rm -f my_con"
				
				
			}

			
		}
		
		stage("3-Publishing")
		{
			steps
			{
				echo "================|| start publishing ||=================="
				sh ' docker login -u *** -p ***'
				sh ' docker push auasis/bairs_site' 
			}
		}
		stage("4-Deployment")
		{
			steps
			{
				echo "===============|| start deployment ||==============="
				sh ' docker run -d -p 8000:80 --name my_con auasis/bairs_site '
			}
		}
	}
}

