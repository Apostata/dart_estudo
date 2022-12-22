/*
  Queue - é uma coleção ordenada entre chaves, sem indice, que manipula o inicio e o fim da lista
  
*/

import 'dart:collection';

void queue() {
  Queue<int?> queue = Queue();
  queue.addAll([20, 30]);
  queue.add(40);
  queue.addFirst(10);
  queue.addLast(50);
  queue.add(60);
  print(queue);
  queue.removeLast();
  queue.add(null);
  queue.forEach((element) {
    print(element);
  });
}

void main(List<String> args) {
  queue();
}
