pipeline 
{
	agent any

	environment 
	{
	 PROJECT_NAME = "Участие в чемпинате"
	 OWNER_NAME   = "Bair Dashiev"
	VAR = sh """ #!/bin/bash docker ps | awk '{print \$1}' | grep -v '^CONTAINER' """
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
				echo "==================|| start building image ||================"
				sh ' docker build -t bairs_site .'
						
			}	
		}
		stage("2-Test")
		{
			
			steps
			{
				
				echo "=================|| start test ||================"
				sh ' docker run -d -p 8000:80 auasis/bairs_site '
				echo "$var"
				script {
				TESTER = sh (
					script : " docker exec ${var} grep 'Instagram' /usr/local/apache2/htdocs/index.html | wc -l  ",
					returnStout : true ) .trim()
				
				}
				test(TESTER)
				sh """#!/bin/bash
				docker rm -f ${var}
				"""
				
			}

			
		}
		
		stage("3-Publishing")
		{
			steps
			{
				echo "================|| start publishing ||=================="
				sh ' docker login -u auasis -p LaLka120'
				sh ' docker push auasis/bairs_site' 
			}
		}
		stage("4-Deployment")
		{
			steps
			{
				echo "===============|| start deployment ||==============="
				sh ' docker run -d -p 8000:80 auasis/bairs_site '
			}
		}
	}
}
def test(TESTER) {
		if (test_result < "1" ) {
			echo "Test Passed"
			return 0
		}
		else { 
			echo "Test Failed"
			return 1 
		}
}
