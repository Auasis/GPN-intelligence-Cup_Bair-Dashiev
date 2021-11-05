# GPN-intelligence-Cup_Bair-Dashiev
Предварительные требования
	 - виртуальная машина или хост с Linux на борту
	 - установить дженкинс (ссылка на документацию) и докер(ссылка)
	 - иметь доступ в репозиторий гитхаб ( если нет писать на почту aquilaromana@mail.ru )
	 - в jenkins file "stage build" требуется заменить * на ваши данные


1   Создание pipeline 

	 - Зайти в "Jenkins"
	 
	 - Нажать "создать item" 


2  Настройка

	 - Ввести имя item'a  и выбрать "pipeline"
	
	 - В "Definition" выбрать "Pipeline script from SCM"
	
	 - В "SCM" - Git

	 - В "Repository URL" вставляете ссылку на свой git репозиторий 
		
	 - В "Credentials" выбираете свой способ подключения к репозиторию, в моем случае это "Username with password"

	 - Выбираете branch в которым находится ваш Jenkinsfile
		
	 - В "Script Path" вводите имя своего Jenkinsfile.		

	 - Нажимаете "Сохранить"
   
3 Запуск pipeline
	
	 - Жмете на кнопку в виде часов

4 Проверка сайта

	 - В поисковую строку вашего браузера вводите hostname:port (port- 8000)
