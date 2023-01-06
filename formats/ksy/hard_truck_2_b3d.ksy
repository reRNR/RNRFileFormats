meta:
  id: hard_truck_2_b3d
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: b3d
  license: MIT
  endian: le
doc:
  Models, game logic objects
enums:
  identifiers:
    0x00000111: nodes_section_start
    0x00000222: nodes_section_end
    0x00000333: nodes_end
    0x00000444: nodes_group
    0x00000555: nodes_start
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

  uv:
    seq:
      - id: u
        type: f4
      - id: v
        type: f4

  normal:
    params:
      - id: p_normal_switch
        type: u4
    seq:
      - id: normal1
        type: point
        if: p_normal_switch == 0
      - id: normal_off1
        type: f4
        if: p_normal_switch == 1

  point:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4

  color:
    seq:
      - id: r
        type: f4
      - id: g
        type: f4
      - id: b
        type: f4

  sphere:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
      - id: r
        type: f4

  name32:
    seq:
      - id: name
        type: str
        encoding: utf-8
        size: 32

  materials_list:
    seq:
      - id: mat_count
        type: u4
      - id: mat_names
        type: name32
        repeat: expr
        repeat-expr: mat_count

  children:
    seq:
      - id: child_cnt
        type: u4
      - id: child_block
        type: block
        repeat: expr
        repeat-expr: child_cnt

  simple_vert:
    seq:
      - id: vert_coord
        type: point
      - id: uv_coord
        type: uv

  poly_vert_8:
    params:
      - id: p_use_uv
        type: bool
      - id: p_use_normal
        type: bool
      - id: p_uv_count
        type: u4
      - id: p_normal_switch
        type: u4
    seq:
      - id: vert_ind
        type: u4
      - id: vert_uv
        type: uv
        repeat: expr
        repeat-expr: p_uv_count
        if: p_use_uv
      - id: vert_normal
        type: normal(p_normal_switch)
        if: p_use_normal

  poly_vert_28:
    params:
      - id: p_use_uv
        type: bool
      - id: p_uv_count
        type: u4
    seq:
      - id: scale_u
        type: u4
      - id: scale_v
        type: u4
      - id: vert_uv
        type: uv
        if: p_use_uv
      - id: vert_uv_extra
        type: uv
        repeat: expr
        repeat-expr: p_uv_count - 1
        if: p_use_uv

  polygon_8:
    instances:
      format:
        value: format_raw ^ 1
      use_uv:
        value: format & 0b10 > 0
      use_normal:
        value: ((format & 0b100000) > 0) and ((format & 0b10000) > 0)
      uv_count:
        value: '((format & 0xff00) >> 8) + (use_uv ? 1 : 0)'
      normal_switch:
        value: 'not (use_normal) ? -1 : (format & 1) > 0 ? 0 : 1'
    seq:
      - id: format_raw
        type: u4
      - id: unk_f
        type: f4
      - id: unk_i
        type: u4
      - id: texnum
        type: u4
      - id: vert_count
        type: u4
      - id: verts
        type: poly_vert_8(use_uv, use_normal, uv_count, normal_switch)
        repeat: expr
        repeat-expr: vert_count

  polygon_28:
    instances:
      format:
        value: format_raw
      use_uv:
        value: format & 0b10 > 0
      use_normal:
        value: ((format & 0b100000) > 0) and ((format & 0b10000) > 0)
      uv_count:
        value: '((format & 0xff00) >> 8) + 1'
      normal_switch:
        value: 'not (use_normal) ? -1 : (format & 1) > 0 ? 0 : 1'
    seq:
      - id: format_raw
        type: u4
      - id: unk_f
        type: f4
      - id: unk_i
        type: u4
      - id: texnum
        type: u4
      - id: vert_count
        type: u4
      - id: verts
        type: poly_vert_28(use_uv, uv_count)
        repeat: expr
        repeat-expr: vert_count

  complex_vert:
    params:
      - id: p_uv_count
        type: u4
      - id: p_normal_switch
        type: u4
    seq:
      - id: vert_coord
        type: point
      - id: uv_coord
        type: uv
      - id: uv_coord_extra
        type: uv
        repeat: expr
        repeat-expr: p_uv_count
      - id: vert_normal
        type: normal(p_normal_switch)


  b_0:
    seq:
    - id: content
      type: f4
      repeat: expr
      repeat-expr: 11

  b_1:
    seq:
    - id: name1
      type: name32
    - id: name2
      type: name32

  b_2:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: child_blocks
      type: children

  b_3:
    seq:
    - id: bound1
      type: sphere
    - id: child_blocks
      type: children

  b_4:
    seq:
    - id: bound1
      type: sphere
    - id: name1
      type: name32
    - id: name2
      type: name32
    - id: child_blocks
      type: children

  b_5:
    seq:
    - id: bound1
      type: sphere
    - id: name1
      type: name32
    - id: child_blocks
      type: children

  b_6:
    seq:
    - id: bound1
      type: sphere
    - id: name1
      type: name32
    - id: name2
      type: name32
    - id: vert_count
      type: u4
    - id: vert
      type: simple_vert
      repeat: expr
      repeat-expr: vert_count
    - id: child_blocks
      type: children

  b_7:
    seq:
    - id: bound1
      type: sphere
    - id: group_name
      type: name32
    - id: vert_count
      type: u4
    - id: vert
      type: simple_vert
      repeat: expr
      repeat-expr: vert_count
    - id: child_blocks
      type: children

  b_8:
    seq:
    - id: bound1
      type: sphere
    - id: poly_count
      type: u4
    - id: poly
      type: polygon_8
      repeat: expr
      repeat-expr: poly_count

  b_9:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: child_blocks
      type: children

  b_10:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: child_blocks
      type: children

  b_11:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: child_blocks
      type: children

  b_12:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count

  b_13:
    seq:
    - id: bound1
      type: sphere
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count

  b_14:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count

  b_15:
    seq:
    - id: bound1
      type: sphere
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count

  b_16:
    seq:
    - id: bound1
      type: sphere
    - id: point1
      type: point
    - id: point2
      type: point
    - id: unk_f1
      type: f4
    - id: unk_f2
      type: f4
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count


  b_17:
    seq:
    - id: bound1
      type: sphere
    - id: point1
      type: point
    - id: point2
      type: point
    - id: unk_f1
      type: f4
    - id: unk_f2
      type: f4
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count

  b_18:
    seq:
    - id: bound1
      type: sphere
    - id: space_name
      type: name32
    - id: add_name
      type: name32

  b_19:
    seq:
    - id: child_blocks
      type: children

  b_20:
    seq:
    - id: bound1
      type: sphere
    - id: coords_count
      type: u4
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count
    - id: coords
      type: point
      repeat: expr
      repeat-expr: coords_count

  b_21:
    seq:
    - id: bound1
      type: sphere
    - id: group_cnt
      type: u4
    - id: unk_i1
      type: u4
    - id: child_blocks
      type: children

  b_22:
    seq:
    - id: bound1
      type: sphere
    - id: unk1
      type: sphere
    - id: child_blocks
      type: children

  b_23:
    types:
      vert_23:
        seq:
        - id: vert_count
          type: u4
        - id: verts
          type: point
          repeat: expr
          repeat-expr: vert_count
    seq:
    - id: unk_i1
      type: u4
    - id: surface
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count
    - id: verts_count
      type: u4
    - id: verts
      type: vert_23
      repeat: expr
      repeat-expr: verts_count

  b_24:
    seq:
    - id: coord1
      type: point
    - id: coord2
      type: point
    - id: coord3
      type: point
    - id: pos
      type: point
    - id: flag
      type: u4
    - id: child_blocks
      type: children

  b_25:
    seq:
    - id: unk_f1
      type: f4
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_p1
      type: point
    - id: unk_p2
      type: point
    - id: unk_f11
      type: f4
    - id: unk_f12
      type: f4
    - id: unk_f13
      type: f4
    - id: unk_f14
      type: f4
    - id: unk_f15
      type: f4

  b_26:
    seq:
    - id: bound1
      type: sphere
    - id: unk_p1
      type: point
    - id: unk_p2
      type: point
    - id: unk_p3
      type: point
    - id: child_blocks
      type: children

  b_27:
    seq:
    - id: bound1
      type: sphere
    - id: flag
      type: u4
    - id: unk_p1
      type: point
    - id: material
      type: u4

  b_28:
    seq:
    - id: bound1
      type: sphere
    - id: sprite_center
      type: point
    - id: poly_count
      type: u4
    - id: vert
      type: polygon_28
      repeat: expr
      repeat-expr: poly_count

  b_29:
    seq:
    - id: bound1
      type: sphere
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_1
      type: sphere
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count
    - id: child_blocks
      type: children

  b_30:
    seq:
    - id: bound1
      type: sphere
    - id: room_name
      type: name32
    - id: point1
      type: point
    - id: point2
      type: point

  b_31:
    types:
      unk_fi:
        seq:
        - id: unkf
          type: f4
        - id: unki
          type: u4
    seq:
    - id: bound1
      type: sphere
    - id: unk_count
      type: u4
    - id: unk1
      type: sphere
    - id: int2
      type: u4
    - id: unk_p2
      type: point
    - id: unk_floats
      type: unk_fi
      repeat: expr
      repeat-expr: unk_count

  b_33:
    seq:
    - id: bound1
      type: sphere
    - id: use_lights
      type: u4
    - id: light_type
      type: u4
    - id: flag
      type: u4
    - id: unk_p1
      type: point
    - id: unk_p2
      type: point
    - id: unk_f1
      type: f4
    - id: unk_f2
      type: f4
    - id: light_radius
      type: f4
    - id: intencity
      type: f4
    - id: unk_f3
      type: f4
    - id: unk_f4
      type: f4
    - id: rgb
      type: color
    - id: child_blocks
      type: children

  b_34:
    types:
      unk_3ff:
        seq:
        - id: unk_3f
          type: point
        - id: unk_i
          type: f4
    seq:
    - id: bound1
      type: sphere
    - id: unk_i1
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: unk_3ff
      repeat: expr
      repeat-expr: unk_count

  b_35:
    seq:
    - id: bound1
      type: sphere
    - id: mtype
      type: u4
    - id: texnum
      type: u4
    - id: poly_count
      type: u4
    - id: vert
      type: polygon_8
      repeat: expr
      repeat-expr: poly_count

  b_36:
    instances:
      format:
        value: format_raw & 0xff
      uv_count:
        value: format_raw >> 8
      normal_switch:
        value: '(format == 1 or format == 2) ? 0 : 1'
    seq:
      - id: bound1
        type: sphere
      - id: name1
        type: name32
      - id: name2
        type: name32
      - id: format_raw
        type: u4
      - id: poly_count
        type: u4
      - id: poly
        type: complex_vert(uv_count, normal_switch)
        repeat: expr
        repeat-expr: poly_count
      - id: child_blocks
        type: children

  b_37:
    instances:
      format:
        value: format_raw & 0xff
      uv_count:
        value: format_raw >> 8
      normal_switch:
        value: '(format == 1 or format == 2) ? 0 : 1'
    seq:
      - id: bound1
        type: sphere
      - id: group_name
        type: name32
      - id: format_raw
        type: u4
      - id: poly_count
        type: u4
      - id: poly
        type: complex_vert(uv_count, normal_switch)
        repeat: expr
        repeat-expr: poly_count
      - id: child_blocks
        type: children

  b_39:
    seq:
    - id: bound1
      type: sphere
    - id: color_r
      type: u4
    - id: unk_f1
      type: f4
    - id: fog_start
      type: f4
    - id: fog_end
      type: f4
    - id: color_id
      type: u4
    - id: child_blocks
      type: children

  b_40:
    seq:
    - id: bound1
      type: sphere
    - id: name1
      type: name32
    - id: name2
      type: name32
    - id: unk_i1
      type: u4
    - id: unk_i2
      type: u4
    - id: unk_count
      type: u4
    - id: unk_floats
      type: f4
      repeat: expr
      repeat-expr: unk_count

  block:
    seq:
      - id: group_block_start
        type: u4
        repeat: until
        repeat-until: _ == 333

      - id: block_name
        type: name32
      - id: block_type
        type: u4

      - id: block_data
        type:
          switch-on: block_type
          cases:
            0: b_0
            1: b_1
            2: b_2
            3: b_3
            4: b_4
            5: b_5
            6: b_6
            7: b_7
            8: b_8
            9: b_9
            10: b_10
            11: b_11
            12: b_12
            13: b_13
            14: b_14
            15: b_15
            16: b_16
            17: b_17
            18: b_18
            19: b_19
            20: b_20
            21: b_21
            22: b_22
            23: b_23
            24: b_24
            25: b_25
            26: b_26
            27: b_27
            28: b_28
            29: b_29
            30: b_30
            31: b_31
            33: b_33
            34: b_34
            35: b_35
            36: b_36
            37: b_37
            39: b_39
            40: b_40

      - id: group_block_end
        type: u4
        repeat: until
        repeat-until: _ == 555

  data_chunks:
    seq:
    - id: data_blocks
      type: block
      repeat: eos

seq:
  - id: b3d_header
    type: file_header

  - id: b3d_materials
    type: materials_list

  - id: begin_blocks
    type: u4
    enum: identifiers

  - id: data_blocks
    size: (b3d_header.len_nodes - 2) * 4
    type: data_chunks

  - id: end_blocks
    type: u4
    enum: identifiers
