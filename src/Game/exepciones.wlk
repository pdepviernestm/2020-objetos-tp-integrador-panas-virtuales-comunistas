object exepciones {
	method romperTodo() {
		throw new DomainException(message = "BOOM")
  }
	
}

  class NoSePudoAtenderException inherits DomainException {
  // no necesita lógica particular, sólo existir
  // lógica que se ejecuta si se lanzó
  // ese tipo de excepción
}
