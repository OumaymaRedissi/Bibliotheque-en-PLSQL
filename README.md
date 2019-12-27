# PLSQL
Class Project 3rd year lfig
# Enoncé
Une bibliothèque est gérée à travers la base de données dont le schéma est ci-dessous. Elle dispose d'un bon nombre d'ouvrages caractérisés par un identifiant, un titre, une année de production, un thème, un nombre de likes et de dislikes obtenus à la suite de chaque prêt d'une copie de l'ouvrage.
À chaque ouvrage correspond un certain nombre de copies qui sont mises à disposition des étudiants pour le prêt. Une copie est caractérisée par un identifiant, un état ('P' pour prêté, 'D' pour disponible ou 'M' pour copie en maintenance) ainsi que l'identifiant de l'ouvrage auquel il est relié (IDO#).
La base gère aussi les étudiants. Chacun est caractérisé par un identifiant interne à l'école, un numéro de CIN unique, un nom et un cursus qu'il étudie (le parcours dans lequel il est inscrit).
Un prêt est fait par un étudiant (IDE#), pour une certaine copie (IDC#), à une date de prêt (DATEP). Le retour de la copie se fait à une certaine date (DATER), la saisie se fait par un bibliothécaire (IDB#) qui saisit par la même occasion l'avis de l'étudiant sur l'ouvrage (AVIS qui a la valeur LIKE ou DISLIKE).
Finalement les bibliothécaires sont gérés dans la table BIBLIO.

# Question 0
Commentez le script de création de la BD et surtout les blocs PL/SQL qui ont servi à l'insertion de lignes.
# Question 1
Créer une procédure P_AFF_INC qui affiche la liste des copies ayant l'état 'D' malgré qu'elles sont actuellement prêtées et non retournées (DATER est NULL). Afficher pour chacune des copies le titre du livre, le code de la copie concernée, son état, la date de prêt et la date de retour (qui est forcément NULL).
# Question 2 
Créer une procédure P_CORR_INC qui corrige cette situation incohérente en affectant l'état 'P' aux copies actuellement prêtées et non retournées.
# Question 3 
Créer une procédure P_AFF_PRETS qui affiche les prêts remis et non remis d'un étudiant dont on entre le CIN en paramètre. Afficher le code de l'étudiant, son CIN, le code de la copie, le titre de l'ouvrage, la date de prêt et la date de remise.
# Question 4 
Créer un trigger T_MAJ_P qui se déclenche avant l'insertion d'une ligne dans PRET. Ce trigger doit mettre à jour la colonne ETAT de la copie à prêter à 'P'. Il doit aussi lire le nom de l'utilisateur qui a lancé la requête INSERT, la chercher dans la table BIBLIO et affecter son identifiant au champ IDB de la ligne à insérer.
# Question 5
Créer une procédure P_INSERT_PRET qui enregistre le prêt d'un ouvrage de code donné à un étudiant de CIN donné avec comme date de prêt la date système. La procédure doit trouver une copie disponible de cet ouvrage et ensuite insérer une ligne dans PRET en utilisant le code de la copie, le code de l'étudiant et la date système comme date de prêt. Les autres champs doivent être NULL. La procédure retourne dans un paramètre la valeur 1 si le prêt a été effectué, et -1 si la procédure n'a pas trouvé de copie disponible pour l'ouvrage en question.
# Question 6 
Créer un trigger T_MAJ_D qui se déclenche après la modification du champ 'DATER' de la table PRET si l'ancienne valeur est NULL et que la nouvelle n'est pas NULL (ici, nous sommes dans le cas d'une modification d'une date de retour de NULL à une valeur non nulle, et donc nous sommes dans le cas d'un retour de prêt). Le trigger doit mettre à jour la copie concernée par ce prêt en modifiant son état à 'D'.
# Question 7
Créer une procédure P_UPDATE_RETOUR qui affecte à un prêt la date de retour, l'avis ('LIKE' ou 'DISLIKE') de l'étudiant par rapport à l'ouvrage emprunté, et le code du bibliothécaire qui effectue le retour de prêt (lire le nom d'utilisateur, et le chercher dans la table BIBLIO). Le prêt est identifié par le CIN de l'étudiant et le code de la copie prêtée.
# Question 8
Créer une procédure P_MAJ_LIKES qui affecte aux champs LIKES et DISLIKES de la table ouvrage le nombre de LIKES et de DISLIKES reçus pour chaque ouvrage.
# Question 9
Créer un trigger T_MAJ_AVIS qui à chaque UPDATE de la colonne AVIS de la table PRET d'incrémenter les colonnes LIKES ou DISLIKES de l'ouvrage concerné en l'incrémentant.
# Question 10
Créer une fonction F_AVIS qui retourne une chaine de caractères renseignant le nombre de LIKES et de DISLIKES d'un ouvrage donné sous cette forme 'LIKES 12, DISLIKES 3'.
# Question 11
Créer une vue V_CTO qui retourne pour chaque cursus, pour chaque theme, et pour chaque ouvrage, le nombre de prêts effectués. La vue est définie sur les colonnes CURSUS, THEME, OUVRAGE, NOMBRE.
# Question 12
Afficher tous les objets BDs qui font partie du schéma de BIBLIO (tables, procédures, fonctions, vues, triggers et séquences) à partir du dictionnaire de données. Afficher aussi les utilisateurs.
# Question 13
Donner à JIHED et TAREK les privilèges de connexion, d'exécution sur les procédures et fonctions créés, et d'accès à la vue V_CTO.
# Question 14
Connectez vous sous JIHED et testez toutes les procédures et fonctions créées.
# Question 15
Toujours sous JIHED, écrire une requête SQL qui affiche pour chaque cursus et chaque thème l'ouvrage ayant eu le plus grand nombre de prêts. utiliser la vue V_CTO.
# TRAVAIL À RENDRE 

1. Projet implémenté à montrer dans uen soutenance technique
2. Imprimé du script en réponse aux 16 questions (de 0 à 15)
3. Le travail doit se faire en binôme (pas de monome et pas de trinomes ou autre).




