List<Map<String, dynamic>> apps = [
  {
    // 0
    "name": "Android",
    "volumen": 7.4,
    "status": true,
    "versions": ["1.0.0", "1.1.0", "3.4.0"],
    "bugs": [
      {"title": "CVE 345", "risk": 9},
    ],
  },
  {
    // 1
    "name": "IOs",
    "volumen": 19.4,
    "status": false,
    "versions": ["2.0", "2.5", "3.4"],
    "bugs": [
      {"title": "CVE 345", "risk": 9}, //0
      {"title": "CVE 90", "risk": 2}, //1
    ],
  },
];

void generalReport() {
  print("=========== Report ==========");
  apps.forEach(
    (app) => {
      print(
        "Nombre: ${app['name']} || Volumen en mercado: ${app['volumen']} M",
      ),
      print("Versiones:"),
      app['versions'].forEach((version) => print(version)),
      print("Bugs reportados:"),
      app['bugs'].forEach(
        (bug) => print("Titulo: ${bug['title']} | Nivel ${bug['risk']}"),
      ),
      print("----------------------------------"),
    },
  );
}

void filterForName(String name) {
  var result = apps.where((app) => app['name'] == name);

  if (result.isNotEmpty) {
    print(result);
  } else {
    print("No hay información");
  }
}

void checkVersion(String version) {
  apps.forEach(
    (app) => {
      if (app['versions'].contains(version))
        {
          print(
            "La version ${version} esta disponible en la plataforma ${app['name']}",
          ),
        },
    },
  );
}

void checkBugs(String title) {
  apps.forEach(
    (app) => {
      print("1r ForEach ${app}"),
      app['bugs'].forEach(
        (bug) => {
          print("2do ForEach ${bug}"),

          if (bug.containsValue(title))
            {
              print(
                "El bug con el titulo: ${title} | Presente en la plataforma ${app['name']}",
              ),
            },
        },
      ),
    },
  );
}

void main() {
  generalReport();
  filterForName("Windows phone");
  filterForName("Android");
  checkVersion("2.5");
  checkBugs('CVE 345');
}
