1. La funzione del determinante è tanto più malcondizionata quanto le molteplicità algebriche degli autovalori aumentano. Questo perché la funzione tende ad appiattirsi intorno alle radici

2. Con autovalori clusterizzati ed errori assoluti in input vicini alla differenza di quest'ultimi il metodo di newton potrebbe convergere all'autovalore sbagliato, rendendo l'output sbagliato.

3. Se l'errore sugli input è 0, tutto dipende da quanto la funzione del determinante è mal condizionata. Questo perchè il primo passo del metodo di newton con una funzione molto "piatta" fa sì che il prossimo punto sia molto distante dalla radice effettiva.