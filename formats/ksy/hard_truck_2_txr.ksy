meta:
  id: hard_truck_2_txr
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: txr
  license: MIT
  endian: le
doc: |
  Textures files for 8 and 16 bit images with mipmaps.
  Pixel format: RGB565, RGBA4444, RGB5551, RGB888.   
seq:
  - id: header
    type: tga_header
  - id: loff
    type: loff_section
    if: header.id_length == 12
  - id: pixel_data
    type:
      switch-on: header.pixel_depth
      cases:
        8: paletted_image
        16: rgba_image
  - id: sections
    type: txr_sections
    if: header.id_length == 12        
types:
  tga_header:
    doc: Format uses TGA Header https://en.wikipedia.org/wiki/Truevision_TGA
    seq:
      - id: id_length
        type: u1
      - id: color_map_type
        type: u1
      - id: image_type
        type: u1  
      - id: first_index_entry
        type: u2
      - id: color_map_length
        type: u2
      - id: color_map_entry_size
        type: u1        

      - id: x_origin
        type: u2   
      - id: y_origin
        type: u2  
      - id: width
        type: u2   
      - id: height
        type: u2  

      - id: pixel_depth
        type: u1   
      - id: image_descriptor
        type: u1 
  loff_section:
    doc: offset to section next to pixel data
    seq: 
      - id: name
        type: str
        size: 4
        encoding: ASCII 
      - id: size
        type: u4
      - id: offset
        type: u4         
  paletted_image: 
    seq:      
      - id: palette
        size: 768
      - id: indexes
        size: _root.header.width * _root.header.height
  rgba_image:
    seq:        
      - id: data
        size: _root.header.width * _root.header.height * (_root.header.pixel_depth / 8)  
  txr_sections:
    seq:
      - id: body
        type: section
        repeat: eos
    types:
      section:
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
                'section_names::lvmp': lvmp_section
                'section_names::pfrm': pfrm_section        
        enums:
          section_names:
            0x504D564C: lvmp
            0x4D524650: pfrm      
        types:
          lvmp_section:
            seq: 
              - id: num_mmaps
                type: u4   
              - id: width
                type: u4  
              - id: height
                type: u4   
              - id: depth
                type: u4  
              - id: mmap
                size: width * height * depth                
              - id: mip_maps
                type: mipmap(_index)
                repeat: expr
                repeat-expr: num_mmaps - 1
              - id: padding
                size: ((((_parent.len + 3) & 255) & 252) | ((((_parent.len + 3) >> 8) << 8))) - _parent.len
            types:
              mipmap :
                params:
                  - id: i
                    type: u4
                seq:
                  - id: data
                    size: w * h  * _parent.depth
                instances:
                  h:
                    value: _parent.width / (2 << i)
                  w:
                    value: _parent.height / (2 << i)               
          pfrm_section:
            seq: 
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
                if: _parent.len > 16         