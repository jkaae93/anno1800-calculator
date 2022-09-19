import 'dart:convert';

class DemandsCounter {
  final int farmers;
  final int workers;
  final int artisans;
  final int engineers;
  final int investors;
  final int scholars;
  final int jornaleros;
  final int obreros;
  final int farmersTr;
  final int workersTr;
  final int artisansTr;
  final int engineersTr;
  final int investorsTr;
  final int scholarsTr;
  final int explorers;
  final int technicians;
  final int sheperds;
  final int elders;

  DemandsCounter({
    this.farmers = 0,
    this.workers = 0,
    this.artisans = 0,
    this.engineers = 0,
    this.investors = 0,
    this.scholars = 0,
    this.jornaleros = 0,
    this.obreros = 0,
    this.farmersTr = 0,
    this.workersTr = 0,
    this.artisansTr = 0,
    this.engineersTr = 0,
    this.investorsTr = 0,
    this.scholarsTr = 0,
    this.explorers = 0,
    this.technicians = 0,
    this.sheperds = 0,
    this.elders = 0,
  });

  DemandsCounter copyWith({
    int? farmers,
    int? workers,
    int? artisans,
    int? engineers,
    int? investors,
    int? scholars,
    int? jornaleros,
    int? obreros,
    int? farmersTr,
    int? workersTr,
    int? artisansTr,
    int? engineersTr,
    int? investorsTr,
    int? scholarsTr,
    int? explorers,
    int? technicians,
    int? sheperds,
    int? elders,
  }) {
    return DemandsCounter(
      farmers: farmers ?? this.farmers,
      workers: workers ?? this.workers,
      artisans: artisans ?? this.artisans,
      engineers: engineers ?? this.engineers,
      investors: investors ?? this.investors,
      scholars: scholars ?? this.scholars,
      jornaleros: jornaleros ?? this.jornaleros,
      obreros: obreros ?? this.obreros,
      farmersTr: farmersTr ?? this.farmersTr,
      workersTr: workersTr ?? this.workersTr,
      artisansTr: artisansTr ?? this.artisansTr,
      engineersTr: engineersTr ?? this.engineersTr,
      investorsTr: investorsTr ?? this.investorsTr,
      scholarsTr: scholarsTr ?? this.scholarsTr,
      explorers: explorers ?? this.explorers,
      technicians: technicians ?? this.technicians,
      sheperds: sheperds ?? this.sheperds,
      elders: elders ?? this.elders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'farmers': farmers,
      'workers': workers,
      'artisans': artisans,
      'engineers': engineers,
      'investors': investors,
      'scholars': scholars,
      'jornaleros': jornaleros,
      'obreros': obreros,
      'farmersTr': farmersTr,
      'workersTr': workersTr,
      'artisansTr': artisansTr,
      'engineersTr': engineersTr,
      'investorsTr': investorsTr,
      'scholarsTr': scholarsTr,
      'explorers': explorers,
      'technicians': technicians,
      'sheperds': sheperds,
      'elders': elders,
    };
  }

  factory DemandsCounter.fromMap(Map<String, dynamic> map) {
    return DemandsCounter(
      farmers: map['farmers'] as int,
      workers: map['workers'] as int,
      artisans: map['artisans'] as int,
      engineers: map['engineers'] as int,
      investors: map['investors'] as int,
      scholars: map['scholars'] as int,
      jornaleros: map['jornaleros'] as int,
      obreros: map['obreros'] as int,
      farmersTr: map['farmersTr'] as int,
      workersTr: map['workersTr'] as int,
      artisansTr: map['artisansTr'] as int,
      engineersTr: map['engineersTr'] as int,
      investorsTr: map['investorsTr'] as int,
      scholarsTr: map['scholarsTr'] as int,
      explorers: map['explorers'] as int,
      technicians: map['technicians'] as int,
      sheperds: map['sheperds'] as int,
      elders: map['elders'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DemandsCounter.fromJson(String source) => DemandsCounter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DemandsCounter(farmers: $farmers, workers: $workers, artisans: $artisans, engineers: $engineers, investors: $investors, scholars: $scholars, jornaleros: $jornaleros, obreros: $obreros, farmersTr: $farmersTr, workersTr: $workersTr, artisansTr: $artisansTr, engineersTr: $engineersTr, investorsTr: $investorsTr, scholarsTr: $scholarsTr, explorers: $explorers, technicians: $technicians, sheperds: $sheperds, elders: $elders)';
  }

  @override
  bool operator ==(covariant DemandsCounter other) {
    if (identical(this, other)) return true;

    return other.farmers == farmers &&
        other.workers == workers &&
        other.artisans == artisans &&
        other.engineers == engineers &&
        other.investors == investors &&
        other.scholars == scholars &&
        other.jornaleros == jornaleros &&
        other.obreros == obreros &&
        other.farmersTr == farmersTr &&
        other.workersTr == workersTr &&
        other.artisansTr == artisansTr &&
        other.engineersTr == engineersTr &&
        other.investorsTr == investorsTr &&
        other.scholarsTr == scholarsTr &&
        other.explorers == explorers &&
        other.technicians == technicians &&
        other.sheperds == sheperds &&
        other.elders == elders;
  }

  @override
  int get hashCode {
    return farmers.hashCode ^
        workers.hashCode ^
        artisans.hashCode ^
        engineers.hashCode ^
        investors.hashCode ^
        scholars.hashCode ^
        jornaleros.hashCode ^
        obreros.hashCode ^
        farmersTr.hashCode ^
        workersTr.hashCode ^
        artisansTr.hashCode ^
        engineersTr.hashCode ^
        investorsTr.hashCode ^
        scholarsTr.hashCode ^
        explorers.hashCode ^
        technicians.hashCode ^
        sheperds.hashCode ^
        elders.hashCode;
  }
}
