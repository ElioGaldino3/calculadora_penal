class Crime {
  final int id;
  final String titulo;
  final int multa;
  final int pena;
  final String? comentario;

  Crime({
    required this.id,
    required this.titulo,
    required this.multa,
    required this.pena,
    this.comentario,
  });
}
