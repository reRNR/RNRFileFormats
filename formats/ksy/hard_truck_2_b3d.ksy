meta:
  id: hard_truck_2_b3d
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: b3d
  license: MIT
  endian: le
doc: |
  Models, game logic objects
seq:
  - id: header
    type: file_header
  - id: materials
    type: material
    repeat: expr
    repeat-expr: header.num_materials 
  - id: nodes
    type: nodes_section
    repeat: eos
enums:
  identifiers:
    0x00000111: nodes_section_start
    0x00000222: nodes_section_end      
    0x00000333: nodes_end
    0x00000444: nodes_section_unknown
    0x00000555: node_start     
types:
  file_header:
    seq:
      - id: magic
        contents: [0x62, 0x33, 0x64, 0x00]
      - id: len_file
        type: u4 
      - id: ofc_materials
        type: u4 
      - id: len_materials_section
        type: u4 
      - id: ofc_nodes
        type: u4  
      - id: len_nodes
        type: u4         
      - id: num_materials
        type: u4
  material:
    seq:  
      - id: name
        size: 32
        type: str
        encoding: ASCII
  nodes_section:
    seq:
      - id: id_nodes_begin
        type: identifiers
        
      - id: node
        type: node
        
      - id: id_nodes_end
        type: identifiers
    types:
      seq:
        node:
          - id: id_node_begin
            type: identifiers
          - id: name
            size: 32
            type: str
          - id: type
            type: u4
          - id: num_child_nodes
            type: u4              
          - id: parameters
            type: node_parameters(type)
          - id: child_nodes
            type: node
            repeat: expr
            repeat-expr: num_child_nodes
          - id: id_node_end
            type: identifiers
        types:
          node_parameters:
            seq: 
              - id: parameters
                switch-on: u4
                  cases:
                    0: node_dummy
                    1: node_dummy
                    2: node_dummy
                    3: node_dummy
                    4: node_dummy
                    5: node_dummy
                    6: node_dummy
                    7: node_dummy
                    8: node_dummy
                    9: node_dummy
                    10: node_dummy
                    11: node_dummy
                    12: node_dummy
                    14: node_dummy  
                    16: node_dummy                      