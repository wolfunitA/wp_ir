## IR-press wolfed 🇺🇦 ⚡
*For linux*

Télécharger le script bash [ir-press.sh](https://github.com/wolfunitA/wp_ir/blob/main/ir-press.sh)

Changer les droits du fichier ir-press.sh pour pouvoir executer le script :
```
chmod +x ir-press.sh
```

Placer votre dictionnaire dans le même répertoire que le script et donner lui le nom suivant : dic01.txt
Si vous n'avez pas de dictionnaire, vous pouvez télécharger un extrait ici : [dictionnaire 01](https://github.com/wolfunitA/wp_ir/blob/main/dic01.txt) 

Pour lancer le script :
```
./ir-press.sh
```

Laissez mijoter !!

Lorsque la sortie dans les logs est différente de :
```
  <value><struct>
  <member><name>faultCode</name><value><int>403</int></value></member>
  <member><name>faultString</name><value><string>Incorrect username or password.</string></value></member>
</struct></value>
```
C'est que vous avez trouvé le mdp du compte !

Vous pouvez voir les logs dans le fichier logs-ir.txt

Bientôt une version python

🇺🇦 ⚡- 2025 - Wolf-A
