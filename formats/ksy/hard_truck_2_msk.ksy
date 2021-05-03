meta:
  id: hard_truck_2_msk
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: msk
  license: MIT
  endian: le
doc: |
  Textures files for 8 (256 biy palette) and 16 bit images compressed with RLE https://en.wikipedia.org/wiki/Run-length_encoding.
  Pixel format: RGB565, RGBA4444, RGB5551.
seq:
  - id: header
    size: 8
    type: file_header
  - id: palette
    size: 768
    type: palette_256 
  - id: data
    type: data_blocks
enums:
  magic_fourcc:
    0x3631534D: mask
    0x4B53414D: ms16      
types:
  file_header:
    seq:
      - id: magic
        type: u4le
        enum: magic_fourcc
      - id: width
        type: u2
      - id: height
        type: u2 
  palette_256:
    seq: 
      - id: color
        type: u2
        repeat: expr
        repeat-expr: 256 
  data_blocks:     
    seq:  
      - id: data 
        type: image_data_block
        repeat: eos
        doc: |
          we can't do much about it, we need some kind of counter to make it work, |
          will see in the future releases of Kaitai, i guess
      - id: data_sections 
        type: sections
    types:
      image_data_block:
        seq:
          - id: length
            type: u1
          - id: raw_data
            size: '_root.header.magic == magic_fourcc::ms16 ? length * 2 : length'
            if: length <= 127
        doc: |
          if length is less than 127 - it's raw data, otherwize it's rle encoded |
          black pixels, for example if length = 129 it means we need to put 
          "129 - 128 = 1 black pixel", pixel must be 2 and 1 byte in size for 16 bit
          and 8 images respectively
      sections:
        seq:         
          - id: fourcc
            type: u4le
            enum: section_names
          - id: section
            type: 
              switch-on: fourcc
              cases:
                'section_names::pfrm': pfrm_section
                'section_names::endr': endr_section
        enums:
          section_names:
            0x52443E45: endr
            0x4D524650: pfrm
        types:
          pfrm_section:
            seq: 
              - id: size
                type: u4               
              - id: red_mask
                type: u4 
              - id: green_mask
                type: u4 
              - id: blue_mask
                type: u4  
              - id: alpha_mask
                type: u4
              - id: unknown_bytes
                size: 12
                if: size > 16 
          endr_section:
            seq: 
              - id: size
                type: u4                      