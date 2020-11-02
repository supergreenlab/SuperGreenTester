package config

modules tester: _MODULE & {
  init: false
  code: false
}

modules tester fields animation: _INT8 & _HTTP_RW & {
  default: 1
}

