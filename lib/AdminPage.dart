import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "GRID dan HERO",
    home: new AdminPage(),
  ));
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => new _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // ignore: deprecated_member_use
  List<Container> daftarSuperhero = new List();

  var karakter = [
    {"nama": "8 Pack Orion X2 Dual System", "gambar": "cpu.jpg"},
    {"nama": "Steelseries Arctis 7", "gambar": "headset.jpg"},
    {"nama": "Stik Lulubox", "gambar": "joystick.jpg"},
    {"nama": "Optimus Maximus", "gambar": "keyboard.jpg"},
    {"nama": "ErgoQuest Zero Gravity Workstation", "gambar": "kursi.jpg"},
    {"nama": "Asus Rog GX800VH", "gambar": "laptop.jpg"},
    {"nama": "Benq Zowie XL2740", "gambar": "monitor.jpg"},
    {"nama": "Razer Lancehead Wireless Laser", "gambar": "mouse.jpg"},
    {"nama": "Razer Firefly", "gambar": "mousepad.jpg"},
    {"nama": "Wilson Audio Alexandria XLF", "gambar": "speaker.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarSuperhero.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new Hero(
                tag: karakternya['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                        nama: karakternya['nama'],
                        gambar: gambar,
                      ),
                    )),
                    child: new Image.asset(
                      "img/$gambar",
                      height: 50,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                karakternya['nama'],
                style: new TextStyle(fontSize: 13.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Welcome Admin"),
        backgroundColor: Colors.green[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            new GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: daftarSuperhero,
            ),
            ElevatedButton.icon(
              label: Text("Log Out"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/MyHomePage');
              },
              style: ElevatedButton.styleFrom(primary: Colors.green[900]),
              icon: Icon(Icons.logout_rounded),
            ),
            SizedBox(
              height: 22,
            )
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 190.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.green[900]),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.green,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.green[900]),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
