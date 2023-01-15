meta:
  id: hard_truck_2_res_rmp
  application: Дальнобойщики 1 и 2 / Hard Truck Road To The Victory, Hard Truck 2 King of The Road
  file-extension: res, rmp
  license: MIT
  endian: le
doc:
  Resource archive
seq:
  - id: section
    type: sections
    repeat: eos
types:
  sections:
    seq:
      - id: section_name
        type: str
        terminator: 0x20
        encoding: ASCII
      - id: num_items
        type: str      
        terminator: 0
        encoding: utf-8
      - id: data
        type:
          switch-on: section_name
          cases:
            '"COLORS"': str_items
            '"TEXTUREFILES"': files
            '"PALETTEFILES"': files
            '"SOUNDFILES"': files
            '"BACKFILES"': files
            '"MATERIALS"': str_items
            '"SOUNDS"': str_items
        repeat: expr
        repeat-expr: num_items.to_i               
    types:    
      str_items:
        seq:
          - id: name
            type: str
            terminator: 0            
            encoding: ASCII
      files:
        seq:            
          - id: item_value
            type: str
            terminator: 0            
            encoding: ASCII
          - id: len_data
            type: u4
          - id: data
            size: len_data            