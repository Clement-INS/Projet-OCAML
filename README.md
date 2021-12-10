Clément VIGAND
Oriane BERRY

Pour compiler:
    make

Pour tester ford:
    executer ftest.native avec comme arguments un graphe, un numero source, un numero destination et un fichier où sera enregistrer le graph final en dot file.
    exemple : ./ftest.native graphs/graph2.txt 0 9 graphs/out.gv.txt

Pour tester le problème d'argent:
    executer atest.native avec comme arguments un fichier avec sur chaque ligne un prénom, le nombre d'argent dépensé par cette personne, et le numéro du noeud correspondant (1,2,3,..., correspond au numéro de ligne du fichier) et un fichier où sera enregistrer le graph final en dot file.
    exemple : ./atest.native annexe/exemple1.txt graphs/out.gv.txt

Pour visualiser le graphe final, executer la commande :
    dot -Tsvg your-dot-file > some-output-file.svg

Résumé :
    Le programme ford fonctionne correctement du moment que le graphe ne contienne qu'un seul arc entre 2 noeuds. e(1,0) et e(0,1) pose problème.

    Le programme consistant à répartir équitablement les remboursements au sein d'un groupe un peu comme le fait tricount marche probablement correctement mais il faut ignorer les arcs négatifs qui sont causé par le problème du graphe initial contenant des arcs dans les deux sens entre deux noeuds. Il faut donc regarder uniquement les arcs positifs pour voir qui doit combien d'agrent à qui.