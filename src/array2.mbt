type Array2[T] Array[T]

pub fn Array2::new[T]() -> Array2[T] {
  Array::new()
}

pub fn Array2::make[T](length : Int, element_0 : T, element_1 : T) -> Array2[T] {
  let array = Array::new()
  for i = 0; i < length; i = i + 1 {
    array.push(element_0)
    array.push(element_1)
  }
  Array2(array)
}

pub fn Array2::from_fixed_array[T](fixed : FixedArray[(T, T)]) -> Array2[T] {
  let length = fixed.length()
  let array = Array::new()
  for i = 0; i < length; i = i + 1 {
    let (element_0, element_1) = fixed[i]
    array.push(element_0)
    array.push(element_1)
  }
  Array2(array)
}

pub fn Array2::to_fixed_array[T](self : Array2[T]) -> FixedArray[(T, T)] {
  FixedArray::makei(self.length(), fn(i) { (self._[i * 2], self._[i * 2 + 1]) })
}

pub fn Array2::output[T : Show](self : Array2[T], logger : Logger) -> Unit {
  logger.write_char('[')
  for i = 0; i < self._.length(); i = i + 2 {
    logger.write_char('(')
    Show::output(self._[i], logger)
    logger.write_string(", ")
    Show::output(self._[i + 1], logger)
    logger.write_char(')')
    if i < self._.length() - 2 {
      logger.write_string(", ")
    }
  }
  logger.write_char(']')
}

pub fn length[T](self : Array2[T]) -> Int {
  self._.length() / 2
}

pub fn op_get[T](self : Array2[T], index : Int) -> (T, T) {
  (self._[index * 2], self._[index * 2 + 1])
}

pub fn op_get_0[T](self : Array2[T], index : Int) -> T {
  self._[index * 2]
}

pub fn op_get_1[T](self : Array2[T], index : Int) -> T {
  self._[index * 2 + 1]
}

pub fn get[T](self : Array2[T], index : Int) -> (T, T)? {
  let length = self.length()
  guard index >= 0 && index < length else { None }
  Some((self._[index * 2], self._[index * 2 + 1]))
}

pub fn get_0[T](self : Array2[T], index : Int) -> T? {
  let length = self.length()
  guard index >= 0 && index < length else { None }
  Some(self._[index * 2])
}

pub fn get_1[T](self : Array2[T], index : Int) -> T? {
  let length = self.length()
  guard index >= 0 && index < length else { None }
  Some(self._[index * 2 + 1])
}

pub fn op_set[T](self : Array2[T], index : Int, element : (T, T)) -> Unit {
  self._[index * 2] = element.0
  self._[index * 2 + 1] = element.1
}

pub fn op_set_0[T](self : Array2[T], index : Int, element : T) -> Unit {
  self._[index * 2] = element
}

pub fn op_set_1[T](self : Array2[T], index : Int, element : T) -> Unit {
  self._[index * 2 + 1] = element
}

pub fn set[T](
  self : Array2[T],
  index : Int,
  element_0 : T,
  element_1 : T
) -> Unit {
  let length = self.length()
  guard index >= 0 && index < length else { return  }
  self._[index * 2] = element_0
  self._[index * 2 + 1] = element_1
}

pub fn op_equal[T : Eq](self : Array2[T], other : Array2[T]) -> Bool {
  guard self.length() == other.length() else { return false }
  for i = 0; i < self._.length(); i = i + 2 {
    if self._[i] != other._[i] || self._[i + 1] != other._[i + 1] {
      return false
    }
  } else {
    true
  }
}

pub fn Array2::each[T](self : Array2[T], f : (T, T) -> Unit) -> Unit {
  for i = 0; i < self._.length(); i = i + 2 {
    f(self._[i], self._[i + 1])
  }
}

pub fn Array2::eachi[T](self : Array2[T], f : (Int, T, T) -> Unit) -> Unit {
  for i = 0; i < self._.length(); i = i + 2 {
    f(i, self._[i], self._[i + 1])
  }
}

pub fn Array2::iter[T](self : Array2[T]) -> Iter[(T, T)] {
  Iter::new(
    fn(yield) {
      for i = 0; i < self._.length(); i = i + 2 {
        match yield((self._[i], self._[i + 1])) {
          IterContinue => ()
          IterEnd => break IterEnd
        }
      } else {
        IterEnd
      }
    },
  )
}

pub fn Array2::iter2[T](self : Array2[T]) -> Iter2[T, T] {
  Iter2::new(
    fn(yield) {
      for i = 0; i < self._.length(); i = i + 2 {
        match yield(self._[i], self._[i + 1]) {
          IterContinue => ()
          IterEnd => break IterEnd
        }
      } else {
        IterEnd
      }
    },
  )
}

pub fn Array2::push[T](self : Array2[T], x : T, y : T) -> Unit {
  self._.push(x)
  self._.push(y)
}
