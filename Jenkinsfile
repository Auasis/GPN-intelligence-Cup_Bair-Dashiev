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
				echo "==================|| start building image ||================"
				sh ' docker build -t bairs_site .'
			
			}	
		}
		stage("2-Publishing")
		{
			steps
			{
				echo "================|| start publishing ||=================="
				sh ' docker login -u auasis -p LaLka120'
				sh ' docker push auasis/bairs_site' 
				
			}
			
		}
		stage("2-Deployment")
		{
			steps
			{
				echo "===============|| start deployment ||==============="
				sh ' docker run auasis/bairs_site '
			}
		
		}
		
	
	}


}
