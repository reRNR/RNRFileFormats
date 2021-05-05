meta:
  id: hard_truck_2_way
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: way
  license: MIT
  endian: le
doc: |
  AI paths and coordinates for objects from .sch files
seq:
  - id: magic
    contents: [0x57, 0x54, 0x57, 0x52]
  - id: len
    type: u4 
  - id: mnam
    type: mnam_chunk
  - id: gdat
    type: gdat_chunk
enums:
  chunk_fourcc:
    0x54414447: gdat
    0x4D4F5247: grom
    0x444F4E52: rnod
    0x4D414E4E: nnam  
    0x4E534F50: posn
    0x47455352: rseg  
    0x52545441: attr   
    0x48544457: wdth
    0x54414456: vdat   
    0x4D414E52: rnam 
    0x47414c46: flag
    0x4E54524F: ortn 
    0x4E455452: rten
    0x4D414E4D: mnam     
types:
  chunk:
    seq:
      - id: fourcc
        type: u4le
        enum: chunk_fourcc
      - id: len
        type: u4           
      - id: chunk_data
        size: len
        type:
          switch-on: fourcc
          cases:
            'chunk_fourcc::rnod': rnod_chunk
            'chunk_fourcc::rseg': rseg_chunk
            'chunk_fourcc::grom': grom_chunk   
            
            'chunk_fourcc::posn': posn_chunk 
            'chunk_fourcc::wdth': wdth_chunk  
            'chunk_fourcc::vdat': vdat_chunk   
            'chunk_fourcc::attr': attr_chunk 
            'chunk_fourcc::flag': flag_chunk
            'chunk_fourcc::ortn': ortn_chunk 
            'chunk_fourcc::rten': rten_chunk  
      - id: padding
        size: (-len & 3)
        if: (-len & 3) > 0
  mnam_chunk:
    seq:
      - id: fourcc
        type: u4le
        enum: chunk_fourcc
      - id: len
        type: u4       
      - id: name_region_short
        size: 4
        type: str
        encoding: ASCII
  gdat_chunk:
    seq:   
      - id: fourcc
        type: u4le
        enum: chunk_fourcc
      - id: len
        type: u4         
      - id: chunks
        type: chunk
        repeat: eos
  grom_chunk:
    seq:   
      - id: name_chunk
        type: rnam_chunk
      - id: chunks
        type: chunk
        repeat: eos
  rnod_chunk:
    seq:   
      - id: name
        type: nnam_chunk
      - id: chunks
        type: chunk
        repeat: eos
  nnam_chunk:
    seq:  
      - id: fourcc
        type: u4le
        enum: chunk_fourcc
      - id: len
        type: u4       
      - id: name
        size: len + (-len & 3)
        type: str
        encoding: ASCII 
  flag_chunk:
    seq:   
      - id: unknown
        type: u4
  posn_chunk:
    seq:   
      - id: x
        type: f8
      - id: y
        type: f8
      - id: z
        type: f8    
  flag_chunk:
    seq:   
      - id: unknown
        type: u4
  rseg_chunk:
    seq:   
      - id: chunks
        type: chunk
        repeat: eos
  attr_chunk:
    seq:   
      - id: unknown1
        type:  u4   
      - id: unknown2
        type:  f8
      - id: num_lane
        type:  u4  
  wdth_chunk:
    seq:   
      - id: unknown1
        type:  f8  
      - id: unknown2
        type:  f8
  vdat_chunk:
    seq:   
      - id: num_points
        type:  vector3f8
    types:
      vector3f8:
        seq:
         - id: x
           type:  f8  
         - id: y
           type:  f8     
         - id: z
           type:  f8   
  rnam_chunk:
    seq:
      - id: fourcc
        type: u4le
        enum: chunk_fourcc
      - id: len
        type: u4        
      - id: name
        size: 12
        type: str
        encoding: ASCII  
  ortn_chunk:
    seq:
       - id: x1
         type:  f8  
       - id: y1
         type:  f8     
       - id: z1
         type:  f8 
       - id: x2
         type:  f8  
       - id: y2
         type:  f8     
       - id: z2
         type:  f8   
       - id: x3
         type:  f8  
       - id: y3
         type:  f8     
       - id: z3
         type:  f8  
  rten_chunk:
    seq:
      - id: name
        size: _parent.len
        type: str
        encoding: ASCII          