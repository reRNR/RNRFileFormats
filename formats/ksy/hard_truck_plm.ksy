meta:
  id: hard_truck_2_plm
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: plm
  license: MIT
  endian: le
doc: |
  Palette 256 byte in size and some additional data
seq:
  - id: magic
    contents: [0x50, 0x4C, 0x4D, 0x00]
  - id: len_data
    type: u4
  - id: sections
    type: sections
    repeat: eos
types:
  sections:
    seq:
      - id: fourcc
        type: u4le
        enum: section_names
      - id: len
        type: u4           
      - id: section
        type:
          switch-on: fourcc
          cases:
            'section_names::palt': palt_section
            'section_names::opac': opac_section 
            'section_names::fog' : fog_section
            'section_names::inte' : inte_section    
    enums:
      section_names:
        0x544C4150: palt
        0x4341504F: opac  
        0x00474F46: fog
        0x45544E49: inte  
    types:
      palt_section:
        seq:
          - id: color_table
            size: _parent.len
      opac_section:
        seq:  
          - id: width
            type: u4  
          - id: height
            type: u4    
          - id: len
            type: u4
          - id: data
            type: palette
            repeat: expr
            repeat-expr: len
        types:
          palette:
            seq:
              - id: pal
                size: _parent.height * _parent.width
      fog_section:
        seq:  
          - id: width
            type: u4  
          - id: height
            type: u4    
          - id: len
            type: u4
          - id: data
            type: palette
            repeat: expr
            repeat-expr: len
        types:
          palette:
            seq:
              - id: pal
                size: _parent.height
      inte_section:
        seq:
          - id: width
            type: u4  
          - id: height
            type: u4    
          - id: len
            type: u4
          - id: data
            type: palette
            repeat: expr
            repeat-expr: len
        types:
          palette:
            seq:
              - id: pal
                size: _parent.height