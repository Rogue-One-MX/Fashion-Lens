import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiverpoolDBRecord extends FirestoreRecord {
  LiverpoolDBRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "SKU" field.
  int? _sku;
  int get sku => _sku ?? 0;
  bool hasSku() => _sku != null;

  // "Imagen1" field.
  String? _imagen1;
  String get imagen1 => _imagen1 ?? '';
  bool hasImagen1() => _imagen1 != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Atributos" field.
  String? _atributos;
  String get atributos => _atributos ?? '';
  bool hasAtributos() => _atributos != null;

  void _initializeFields() {
    _sku = castToType<int>(snapshotData['SKU']);
    _imagen1 = snapshotData['Imagen1'] as String?;
    _name = snapshotData['Name'] as String?;
    _atributos = snapshotData['Atributos'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LiverpoolDB');

  static Stream<LiverpoolDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LiverpoolDBRecord.fromSnapshot(s));

  static Future<LiverpoolDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LiverpoolDBRecord.fromSnapshot(s));

  static LiverpoolDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LiverpoolDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LiverpoolDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LiverpoolDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LiverpoolDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LiverpoolDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLiverpoolDBRecordData({
  int? sku,
  String? imagen1,
  String? name,
  String? atributos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'SKU': sku,
      'Imagen1': imagen1,
      'Name': name,
      'Atributos': atributos,
    }.withoutNulls,
  );

  return firestoreData;
}

class LiverpoolDBRecordDocumentEquality implements Equality<LiverpoolDBRecord> {
  const LiverpoolDBRecordDocumentEquality();

  @override
  bool equals(LiverpoolDBRecord? e1, LiverpoolDBRecord? e2) {
    return e1?.sku == e2?.sku &&
        e1?.imagen1 == e2?.imagen1 &&
        e1?.name == e2?.name &&
        e1?.atributos == e2?.atributos;
  }

  @override
  int hash(LiverpoolDBRecord? e) =>
      const ListEquality().hash([e?.sku, e?.imagen1, e?.name, e?.atributos]);

  @override
  bool isValidKey(Object? o) => o is LiverpoolDBRecord;
}
