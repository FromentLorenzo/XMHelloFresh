import xml.etree.ElementTree as ET

def generer_html_utilisateurs(chemin_xml):
    tree = ET.parse(chemin_xml)
    root = tree.getroot()

    utilisateurs = root.find(".//Utilisateurs")

    html_content = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liste des Utilisateurs</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Liste des Utilisateurs</h1>
        <ul>
    """

    for utilisateur in utilisateurs.findall(".//Utilisateur"):
        id_utilisateur = utilisateur.get("id")
        nom = utilisateur.find("Nom").text
        prenom = utilisateur.find("Prénom").text
        adresse = utilisateur.find("Adresse").text
        telephone = utilisateur.find("Numéro_de_téléphone").text
        email = utilisateur.find("Adresse_mail").text
        mot_de_passe = utilisateur.find("Mot_de_passe_hashé").text

        html_content += f"""
            <li>
                <strong>ID:</strong> {id_utilisateur}<br>
                <strong>Nom:</strong> {nom}<br>
                <strong>Prénom:</strong> {prenom}<br>
                <strong>Adresse:</strong> {adresse}<br>
                <strong>Téléphone:</strong> {telephone}<br>
                <strong>Email:</strong> {email}<br>
                <strong>Mot de passe:</strong> {mot_de_passe}<br>
            </li>
        """

    html_content += """
        </ul>
    </body>
    </html>
    """

    with open("output_utilisateurs.html", "w", encoding="utf-8") as html_file:
        html_file.write(html_content)

if __name__ == "__main__":
    chemin_xml = "XMLHelloFresh6.xml"
    generer_html_utilisateurs(chemin_xml)
