import 'dart:convert';

import 'package:equatable/equatable.dart';

class Currencies extends Equatable {
  final String? aed;
  final String? ars;
  final String? aud;
  final String? brl;
  final String? btc;
  final String? cad;
  final String? chf;
  final String? clp;
  final String? cny;
  final String? cop;
  final String? czk;
  final String? dkk;
  final String? eur;
  final String? gbp;
  final String? hkd;
  final String? huf;
  final String? hrk;
  final String? idr;
  final String? ils;
  final String? inr;
  final String? isk;
  final String? jpy;
  final String? krw;
  final String? kwd;
  final String? mxn;
  final String? myr;
  final String? mad;
  final String? nok;
  final String? nzd;
  final String? pen;
  final String? php;
  final String? pln;
  final String? ron;
  final String? rub;
  final String? sek;
  final String? sgd;
  final String? thb;
  final String? usdtry;
  final String? twd;
  final String? xag;
  final String? xau;
  final String? zar;

  const Currencies({
    this.aed,
    this.ars,
    this.aud,
    this.brl,
    this.btc,
    this.cad,
    this.chf,
    this.clp,
    this.cny,
    this.cop,
    this.czk,
    this.dkk,
    this.eur,
    this.gbp,
    this.hkd,
    this.huf,
    this.hrk,
    this.idr,
    this.ils,
    this.inr,
    this.isk,
    this.jpy,
    this.krw,
    this.kwd,
    this.mxn,
    this.myr,
    this.mad,
    this.nok,
    this.nzd,
    this.pen,
    this.php,
    this.pln,
    this.ron,
    this.rub,
    this.sek,
    this.sgd,
    this.thb,
    this.usdtry,
    this.twd,
    this.xag,
    this.xau,
    this.zar,
  });

  factory Currencies.fromMap(Map<String, dynamic> data) => Currencies(
        aed: data['AED'] as String?,
        ars: data['ARS'] as String?,
        aud: data['AUD'] as String?,
        brl: data['BRL'] as String?,
        btc: data['BTC'] as String?,
        cad: data['CAD'] as String?,
        chf: data['CHF'] as String?,
        clp: data['CLP'] as String?,
        cny: data['CNY'] as String?,
        cop: data['COP'] as String?,
        czk: data['CZK'] as String?,
        dkk: data['DKK'] as String?,
        eur: data['EUR'] as String?,
        gbp: data['GBP'] as String?,
        hkd: data['HKD'] as String?,
        huf: data['HUF'] as String?,
        hrk: data['HRK'] as String?,
        idr: data['IDR'] as String?,
        ils: data['ILS'] as String?,
        inr: data['INR'] as String?,
        isk: data['ISK'] as String?,
        jpy: data['JPY'] as String?,
        krw: data['KRW'] as String?,
        kwd: data['KWD'] as String?,
        mxn: data['MXN'] as String?,
        myr: data['MYR'] as String?,
        mad: data['MAD'] as String?,
        nok: data['NOK'] as String?,
        nzd: data['NZD'] as String?,
        pen: data['PEN'] as String?,
        php: data['PHP'] as String?,
        pln: data['PLN'] as String?,
        ron: data['RON'] as String?,
        rub: data['RUB'] as String?,
        sek: data['SEK'] as String?,
        sgd: data['SGD'] as String?,
        thb: data['THB'] as String?,
        usdtry: data['USDTRY'] as String?,
        twd: data['TWD'] as String?,
        xag: data['XAG'] as String?,
        xau: data['XAU'] as String?,
        zar: data['ZAR'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'AED': aed,
        'ARS': ars,
        'AUD': aud,
        'BRL': brl,
        'BTC': btc,
        'CAD': cad,
        'CHF': chf,
        'CLP': clp,
        'CNY': cny,
        'COP': cop,
        'CZK': czk,
        'DKK': dkk,
        'EUR': eur,
        'GBP': gbp,
        'HKD': hkd,
        'HUF': huf,
        'HRK': hrk,
        'IDR': idr,
        'ILS': ils,
        'INR': inr,
        'ISK': isk,
        'JPY': jpy,
        'KRW': krw,
        'KWD': kwd,
        'MXN': mxn,
        'MYR': myr,
        'MAD': mad,
        'NOK': nok,
        'NZD': nzd,
        'PEN': pen,
        'PHP': php,
        'PLN': pln,
        'RON': ron,
        'RUB': rub,
        'SEK': sek,
        'SGD': sgd,
        'THB': thb,
        'USDTRY': usdtry,
        'TWD': twd,
        'XAG': xag,
        'XAU': xau,
        'ZAR': zar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Currencies].
  factory Currencies.fromJson(String data) {
    return Currencies.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Currencies] to a JSON string.
  String toJson() => json.encode(toMap());

  Currencies copyWith({
    String? aed,
    String? ars,
    String? aud,
    String? brl,
    String? btc,
    String? cad,
    String? chf,
    String? clp,
    String? cny,
    String? cop,
    String? czk,
    String? dkk,
    String? eur,
    String? gbp,
    String? hkd,
    String? huf,
    String? hrk,
    String? idr,
    String? ils,
    String? inr,
    String? isk,
    String? jpy,
    String? krw,
    String? kwd,
    String? mxn,
    String? myr,
    String? mad,
    String? nok,
    String? nzd,
    String? pen,
    String? php,
    String? pln,
    String? ron,
    String? rub,
    String? sek,
    String? sgd,
    String? thb,
    String? usdtry,
    String? twd,
    String? xag,
    String? xau,
    String? zar,
  }) {
    return Currencies(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      cop: cop ?? this.cop,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      hrk: hrk ?? this.hrk,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      isk: isk ?? this.isk,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      mad: mad ?? this.mad,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      pen: pen ?? this.pen,
      php: php ?? this.php,
      pln: pln ?? this.pln,
      ron: ron ?? this.ron,
      rub: rub ?? this.rub,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      usdtry: usdtry ?? this.usdtry,
      twd: twd ?? this.twd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      zar: zar ?? this.zar,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      aed,
      ars,
      aud,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      cop,
      czk,
      dkk,
      eur,
      gbp,
      hkd,
      huf,
      hrk,
      idr,
      ils,
      inr,
      isk,
      jpy,
      krw,
      kwd,
      mxn,
      myr,
      mad,
      nok,
      nzd,
      pen,
      php,
      pln,
      ron,
      rub,
      sek,
      sgd,
      thb,
      usdtry,
      twd,
      xag,
      xau,
      zar,
    ];
  }
}
