# testes_automatizados_dart_flutter_001
Estudos de testes automatizados em Dart e Flutter. 

Como o foco é aprender e testar os recursos para testes automatizados, não serão implementadas as melhores práticas, como criar mappers para tarefas de mapear dados de JSON( e outros formatos ) para entidades, ou criar datasources para separar toda a parte de obter dados, separando a responsabilidade de cada tarefa entre as classes Repositories e DataSources.

Para testes de consulta a dados de API foi utilizado o Mocktail.

Para teste de BLoC também foi utilizado o Mocktail para o mock do repositorio, evitando processamento desnecessario, ja que existem testes específicos para o repositorio.