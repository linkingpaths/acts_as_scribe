Feature: Activity Streams
  In order to represent activity streams
  As a developer
  I want to bea able to add activity registration hooks on the AR models
  
  Scenario: Action executed by actor
    Given I'm a user
    When I create a membership
    Then a new activity should be reported
    And the activity should be related to me

#  USE CASES
#
#  [ACTOR-S]                             [ACTION]                    [OBJECT] 
#
#  Obie Fernandez                        escribió                    una nueva nota. 
#  Obie Fernandez y Steven Bustos        son amigos.  
#  Manuel Gonzalez Noriega               se ha hecho fan             de Monkey Island.
#  Manuel Gonzalez Noriega               se ha unido al              grupo Do you poken?
#  Obie Fernandez y Rogelio J. Samour    ahora son amigos(as)        gracias a "Personas que quizá conozcas". 
#  Obie Fernandez                        posted                      “Rane and Serano (instead of working)."
#  Angela Lerma                          se hizo fan de              "Soy 100% Colombiano!"
#  Obie Fernandez                        subió desde el móvil        una foto
#  Obie Fernandez                        [puso su status a]          "is crazy for staying up this late."
#  Fulano                                ha compartido               el post 'De Fulanos y Menganos' con el grupo 'Futaneros'
#  Aitor                                 ha jugado                   un partido +3 en el campo 'meaztegi'