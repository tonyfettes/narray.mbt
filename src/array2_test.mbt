test "@narray.Array2::new" {
  let array : @narray.Array2[Int] = @narray.Array2::new()
  inspect!(array, content="[]")
}

test "@narray.Array2::make" {
  let array = @narray.Array2::make(3, 1, 2)
  inspect!(array, content="[(1, 2), (1, 2), (1, 2)]")
}

test "@narray.Array2::from_fixed_array" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  inspect!(array, content="[(1, 2), (3, 4), (5, 6)]")
  inspect!(array.length(), content="3")
}

test "@narray.Array2::to_fixed_array" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let fixed = array.to_fixed_array()
  inspect!(fixed, content="[(1, 2), (3, 4), (5, 6)]")
}

test "@narray.Array2::op_get" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  inspect!(array[0], content="(1, 2)")
  inspect!(array[1], content="(3, 4)")
  inspect!(array[2], content="(5, 6)")
  inspect!(array.op_get_0(0), content="1")
  inspect!(array.op_get_0(1), content="3")
  inspect!(array.op_get_0(2), content="5")
  inspect!(array.op_get_1(0), content="2")
  inspect!(array.op_get_1(1), content="4")
  inspect!(array.op_get_1(2), content="6")
}

test "panic @narray.Array2::op_get" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  inspect!(array[3], content="panic")
}

test "panic @narray.Array2::op_get_0" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  inspect!(array.op_get_0(3), content="panic")
}

test "panic @narray.Array2::op_get_1" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  inspect!(array.op_get_1(3), content="panic")
}

test "@narray.Array2::get" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  inspect!(array.get(0), content="Some((1, 2))")
  inspect!(array.get(1), content="Some((3, 4))")
  inspect!(array.get(2), content="Some((5, 6))")
  inspect!(array.get(3), content="None")
  inspect!(array.get_0(0), content="Some(1)")
  inspect!(array.get_0(1), content="Some(3)")
  inspect!(array.get_0(2), content="Some(5)")
  inspect!(array.get_0(3), content="None")
  inspect!(array.get_1(0), content="Some(2)")
  inspect!(array.get_1(1), content="Some(4)")
  inspect!(array.get_1(2), content="Some(6)")
  inspect!(array.get_1(3), content="None")
}

test "@narray.Array2::op_set" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  array[0] = (7, 8)
  inspect!(array, content="[(7, 8), (3, 4), (5, 6)]")
  array[1] = (9, 10)
  inspect!(array, content="[(7, 8), (9, 10), (5, 6)]")
  array.op_set(2, (11, 12))
  inspect!(array, content="[(7, 8), (9, 10), (11, 12)]")
  array.op_set_0(1, 9)
  inspect!(array, content="[(7, 8), (9, 10), (11, 12)]")
  array.op_set_1(2, 10)
  inspect!(array, content="[(7, 8), (9, 10), (11, 10)]")
}

test "@narray.Array2::set" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  array.set(0, 7, 8)
  inspect!(array, content="[(7, 8), (3, 4), (5, 6)]")
  array.set(1, 9, 10)
  inspect!(array, content="[(7, 8), (9, 10), (5, 6)]")
  array.set(2, 11, 12)
  inspect!(array, content="[(7, 8), (9, 10), (11, 12)]")
  array.set(3, 13, 14)
  inspect!(array, content="[(7, 8), (9, 10), (11, 12)]")
}

test "@narray.Array2::op_equal" {
  let array0 = @narray.Array2::from_fixed_array([(1, 2), (3, 4)])
  let array1 = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let array2 = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let array3 = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 7)])
  let array4 = @narray.Array2::from_fixed_array([(1, 2), (4, 4), (5, 7)])
  inspect!(array0 == array0, content="true")
  inspect!(array0 != array0, content="false")
  inspect!(array0 == array1, content="false")
  inspect!(array0 != array1, content="true")
  inspect!(array1 == array1, content="true")
  inspect!(array1 != array1, content="false")
  inspect!(array1 == array2, content="true")
  inspect!(array1 != array2, content="false")
  inspect!(array1 == array3, content="false")
  inspect!(array1 != array3, content="true")
  inspect!(array4 == array3, content="false")
  inspect!(array4 != array3, content="true")
}

test "@narray.Array2::each" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let result = []
  array.each(fn(element_0, element_1) { result.push((element_0, element_1)) })
  inspect!(result, content="[(1, 2), (3, 4), (5, 6)]")
}

test "@narray.Array2::eachi" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let result = []
  array.eachi(
    fn(index, element_0, element_1) {
      result.push((index, element_0, element_1))
    },
  )
  inspect!(result, content="[(0, 1, 2), (2, 3, 4), (4, 5, 6)]")
}

test "@narray.Array2::iter" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let result = []
  for element in array.iter() {
    result.push(element)
  }
  inspect!(result, content="[(1, 2), (3, 4), (5, 6)]")
  let result = []
  let value = for element in array.iter() {
    if element.0 > 3 {
      break 3
    }
    result.push(element)
  } else {
    4
  }
  inspect!(result, content="[(1, 2), (3, 4)]")
  inspect!(value, content="3")
}

test "@narray.Array2::iter2" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  let result = []
  for element_0, element_1 in array.iter2() {
    result.push((element_0, element_1))
  }
  inspect!(result, content="[(1, 2), (3, 4), (5, 6)]")
  let result = []
  let value = for element_0, element_1 in array.iter2() {
    if element_0 > 3 {
      break 3
    }
    result.push((element_0, element_1))
  } else {
    4
  }
  inspect!(result, content="[(1, 2), (3, 4)]")
  inspect!(value, content="3")
}

test "@narray.Array2::push" {
  let array = @narray.Array2::from_fixed_array([(1, 2), (3, 4), (5, 6)])
  array.push(7, 8)
  inspect!(array, content="[(1, 2), (3, 4), (5, 6), (7, 8)]")
}
