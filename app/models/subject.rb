class Subject < ActiveHash::Base
  self.data = [
    { id: 1, name: '英語'},
    { id: 2, name: '数学'},
    { id: 3, name: '国語'},
    { id: 4, name: '理科'},
    { id: 5, name: '社会'},
  ]
end
