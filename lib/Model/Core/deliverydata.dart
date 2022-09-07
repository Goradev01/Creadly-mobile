class DeliveryData {
  Map? lagosAgege;
  Map? lagosAjeromiIfelodun;
  Map? lagosAlimosho;
  Map? lagosAmuwoOdofin;
  Map? lagosBadagry;
  Map? lagosApapa;
  Map? lagosEpe;
  Map? lagosEtiOsa;
  Map? lagosIbejuLekki;
  Map? lagosIfakoIjaiye;
  Map? lagosIkeja;
  Map? lagosIkorodu;
  Map? lagosKosofe;
  Map? lagosLagosIsland;
  Map? lagosMushin;
  Map? lagosLagosMainland;
  Map? lagosOjo;
  Map? lagosOshodiIsolo;
  Map? lagosShomolu;
  Map? lagosSurulereLagosState;
  Map? northCentral;
  Map? northEast;
  Map? northWest;
  Map? southEast;
  Map? southSouth;
  Map? southWest;
  DeliveryData({
    required this.lagosAgege,
    required this.lagosAjeromiIfelodun,
    required this.lagosAlimosho,
    required this.lagosAmuwoOdofin,
    required this.lagosBadagry,
    required this.lagosApapa,
    required this.lagosEpe,
    required this.lagosEtiOsa,
    required this.lagosIbejuLekki,
    required this.lagosIfakoIjaiye,
    required this.lagosIkeja,
    required this.lagosIkorodu,
    required this.lagosKosofe,
    required this.lagosLagosIsland,
    required this.lagosMushin,
    required this.lagosLagosMainland,
    required this.lagosOjo,
    required this.lagosOshodiIsolo,
    required this.lagosShomolu,
    required this.lagosSurulereLagosState,
    required this.northCentral,
    required this.northEast,
    required this.northWest,
    required this.southEast,
    required this.southSouth,
    required this.southWest,
  });
  DeliveryData.fromJson(Map<String, dynamic> map) {
    lagosAgege = map['lagosAgege'];
    lagosAjeromiIfelodun = map['lagosAjeromiIfelodun'];
    lagosAlimosho = map['lagosAlimosho'];
    lagosAmuwoOdofin = map['lagosAmuwoOdofin'];
    lagosBadagry = map['lagosBadagry'];
    lagosApapa = map['lagosApapa'];
    lagosEpe = map['lagosEpe'];
    lagosEtiOsa = map['lagosEtiOsa'];
    lagosIbejuLekki = map['lagosIbejuLekki'];
    lagosIfakoIjaiye = map['lagosIfakoIjaiye'];
    lagosIkeja = map['lagosIkeja'];
    lagosIkorodu = map['lagosIkorodu'];
    lagosKosofe = map['lagosKosofe'];
    lagosLagosIsland = map['lagosLagosIsland'];
    lagosMushin = map['lagosMushin'];
    lagosLagosMainland = map['lagosLagosMainland'];
    lagosOjo = map['lagosOjo'];
    lagosOshodiIsolo = map['lagosOshodiIsolo'];
    lagosShomolu = map['lagosShomolu'];
    lagosSurulereLagosState = map['lagosSurulereLagosState'];
    northCentral = map['northCentral'];
    northEast = map['northEast'];
    northWest = map['northWest'];
    southEast = map['southEast'];
    southSouth = map['southSouth'];
    southWest = map['southWest'];
  }
  Map<String, dynamic> toJson() => {
        'lagosAgege': lagosAgege,
        'lagosAjeromiIfelodun': lagosAjeromiIfelodun,
        'lagosAlimosho': lagosAlimosho,
        'lagosAmuwoOdofin': lagosAmuwoOdofin,
        'lagosBadagry': lagosBadagry,
        'lagosApapa': lagosApapa,
        'lagosEpe': lagosEpe,
        'lagosEtiOsa': lagosEtiOsa,
        'lagosIbejuLekki': lagosIbejuLekki,
        'lagosIfakoIjaiye': lagosIfakoIjaiye,
        'lagosIkeja': lagosIkeja,
        'lagosIkorodu': lagosIkorodu,
        'lagosKosofe': lagosKosofe,
        'lagosLagosIsland': lagosLagosIsland,
        'lagosMushin': lagosMushin,
        'lagosLagosMainland': lagosLagosMainland,
        'lagosOjo': lagosOjo,
        'lagosOshodiIsolo': lagosOshodiIsolo,
        'lagosShomolu': lagosShomolu,
        'lagosSurulereLagosState': lagosSurulereLagosState,
        'northCentral': northCentral,
        'northEast': northEast,
        'northWest': northWest,
        'southEast': southEast,
        'southSouth': southSouth,
        'southWest': southWest,
      };
}
