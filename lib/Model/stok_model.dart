
class StokModel {
  String? _urunKodu;
  String? _urunAdi;
  String? _barkod;
  String? _bakiye;
  String? _birim;
  String? _birim2;
  String? _birim3;
  int? _kdv;
  String? _kategori;
  String? _anaGrup;
  String? _altGrup;
  String? _sektor;
  String? _reyon;
  String? _marka;
  String? _model;

  StokModel(
      String? urunKodu,
      String? urunAdi,
      String? barkod,
      String? bakiye,
      String? birim,
      String? birim2,
      String? birim3,
      int? kdv,
      String? kategori,
      String? anaGrup,
      String? altGrup,
      String? sektor,
      String? reyon,
      String? marka,
      String? model) {
      this._urunKodu = urunKodu;
      this._urunAdi = urunAdi;
      this._barkod = barkod;
      this._bakiye = bakiye;
      this._birim = birim;
      this._birim2 = birim2;
      this._birim3 = birim3;
      this._kdv = kdv;
      this._kategori = kategori;
      this._anaGrup = anaGrup;
      this._altGrup = altGrup;
      this._sektor = sektor;
      this._reyon = reyon;
      this._marka = marka;
      this._model = model;

  }
}
