meta:
  id: hard_truck_2_tech
  application: Дальнобойщики 2 (8.x) / Hard Truck 2 King of The Road 1.3
  file-extension: tech
  license: MIT
  endian: le
doc: |
  Physic objects parameters: cars, trucks, different objects....
seq:
  - id: th_header
    size: 57  
    type: tech_header
  - id: techs
    type: tech_section
  - id: time_stamps
    type: time_stamp
  - id: tb_header
    size: 36 
    type: trashbox_header 
  - id: trashboxes
    type: trashbox_section  
types:
  vector3f:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4  
  vector4f:
    seq:
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4   
      - id: w
        type: f4         
  tech_header:
    seq:
      - id: filename_length
        type: u4
      - id: filename
        type: str
        size: filename_length
        encoding: ASCII         
      - id: timestamp
        type: u4 
      - id: len_section
        type: u4             
      - id: num_cars
        type: u4  
      - id: unknown
        type: u4 
      - id: ofs_index_lorries
        type: u4 
      - id: ofs_index_tractors
        type: u4 
      - id: ofs_index_trailers
        type: u4 
      - id: ofs_index_helicopters
        type: u4 
      - id: ofs_index_vehicles
        type: u4
  tech_section:
    seq:
      - id: tech
        type: tech
        repeat: expr
        repeat-expr: 80
    types:
      tech:
        seq:
          - id: unknown1
            size: 36
          - id: center_mass_in_b3d
            size: 12
            type: vector3f
          - id: unknown2
            size: 48 
          - id: mass
            type: f4
          - id: r_wheel
            type: f4   
          - id: r_wheel1
            type: f4    
          - id: tank
            type: f4    
          - id: fuel_time_endurance
            type: f4 
          - id: unknown3
            size: 28 
          - id: num_gear
            type: f4  
          - id: unknown4
            size: 12
          - id: fuel_consumption
            type: f4     
          - id: unknown5
            size: 4
          - id: kilometrage
            type: f4   
          - id: air_press_coeff
            type: f4 
          - id: air_resist_coeff
            type: f4  
          - id: air_side_resist_coeff
            type: f4   
          - id: front_wheel_thic
            type: f4  
          - id: rear_wheel_thic
            type: f4  
          - id: max_rot_momentum
            type: f4  
          - id: unknown6
            size: 4   
          - id: break_power
            type: f4     
          - id: rear_axle_coeff
            type: f4  
          - id: reverse_trans_coeff
            type: f4    
          - id: gear_trans_coeff
            type: f4
            repeat: expr
            repeat-expr: 14
          - id: tach_with_max_pow
            type: f4  
          - id: cargo_and_body_pick_load
            type: f4   
          - id: body_mass
            type: f4    
          - id: body_height
            type: f4  
          - id: body_square
            type: f4    
          - id: center_of_cargo_bottom
            type: vector3f    
          - id: driving_wheels
            type: u4
            repeat: expr
            repeat-expr: 8        
          - id: steering_wheels
            type: u4 
            repeat: expr
            repeat-expr: 8       
          - id: touching_wheels
            type: u4 
            repeat: expr
            repeat-expr: 8       
          - id: ov
            type: vector3f
          - id: tang_viewer
            type: f4
          - id: inertia
            type: vector3f
          - id: rs0
            type: vector3f
          - id: rs1
            type: vector3f
          - id: rs2
            type: vector3f
          - id: rs3
            type: vector3f
          - id: unknown7
            size: 244
          - id: buffer
            type: str
            size: 32    
            encoding: ASCII         
          - id: suspension
            type: f4 
            repeat: expr
            repeat-expr: 8
          - id: ks
            type: f4 
            repeat: expr
            repeat-expr: 8        
          - id: cs
            type: f4 
            repeat: expr
            repeat-expr: 8        
          - id: collision_radius
            type: f4  
          - id: collision_center
            type: vector3f
          - id: unknown8
            size: 4 
          - id: rubber_collusion_coeff
            type: f4
          - id: slide_collusion_coeff
            type: f4   
          - id: num_corner_mark
            type: u4  
          - id: num_add_col_pnts
            type: u4 
          - id: corner_mark
            type: vector3f
            repeat: expr
            repeat-expr: 20
          - id: add_col_pnts
            type: vector3f
            repeat: expr
            repeat-expr: 20 
          - id: unknown9
            size: 36 
          - id: num_corner_mark_w
            type: u4 
          - id: corner_mark_w
            type: vector3f
            repeat: expr
            repeat-expr: 4
          - id: col_plane
            type: vector4f
            repeat: expr
            repeat-expr: 20   
          - id: num_col_plane
            type: u4
          - id: unknown10
            size: 8 
          - id: tv_camera_pos
            type: vector3f
            repeat: expr
            repeat-expr: 5  
          - id: num_tv_camera
            type: u4
          - id: tv_camera_right_corner
            type: vector3f     
          - id: smoke_position
            type: vector3f 
          - id: smoke_direction
            type: vector3f  
          - id: smoke_position2
            type: vector3f
          - id: smoke_direction2
            type: vector3f 
          - id: flame_place
            type: vector3f    
          - id: fara_fl
            type: vector3f
          - id: fara_fr
            type: vector3f   
          - id: fara_bls
            type: vector3f    
          - id: fara_brs
            type: vector3f 
          - id: fara_bl
            type: vector3f   
          - id: fara_br
            type: vector3f 
          - id: horse_power
            type: u4  
          - id: price
            type: u4   
          - id: glowwing
            type: f4 
          - id: low_saddle
            type: vector3f  
          - id: top_saddle
            type: vector3f
          - id: tow_hook
            type: vector3f  
          - id: coupler
            type: vector3f   
          - id: shift_saddle
            type: f4 
          - id: coupler_length
            type: f4  
          - id: speed_scale
            type: f4 
          - id: unknown11
            size: 4  
          - id: tach_scale
            type: f4         
          - id: unknown12
            size: 4    
          - id: fuel_scale
            type: f4  
          - id: cabr_window
            type: vector3f  
          - id: cabl_window
            type: vector3f    
          - id: cab_front_window
            type: f4 
            repeat: expr
            repeat-expr: 4   
          - id: drivers_neck_and_driver_neck_ang
            type: f4 
            repeat: expr
            repeat-expr: 7  
          - id: unknown13
            size: 8 
          - id: cockpit_space_name
            type: str
            size: 60    
            encoding: ASCII         
          - id: tch_name
            type: str
            size: 30 
            encoding: ASCII         
          - id: vch_name
            type: str
            size: 30 
            encoding: ASCII         
          - id: name
            type: str
            size: 30  
            encoding: ASCII         
          - id: prefix
            type: str
            size: 20 
            encoding: ASCII 
          - id: prefix_cab
            type: str
            size: 20 
            encoding: ASCII 
          - id: car_node
            type: str
            size: 30 
            encoding: ASCII         
          - id: unknown14
            size: 4
          - id: trailer_type
            type: u4             
          - id: fara_dir
            type: f4 
            repeat: expr
            repeat-expr: 6
          - id: fara_width
            type: f4 
            repeat: expr
            repeat-expr: 3       
  time_stamp:
    seq:  
      - id: timestamp
        type: u4    
        repeat: expr
        repeat-expr: _root.th_header.num_cars
  trashbox_header :
    seq:
      - id: len_section
        type: u4
      - id: num_trashbox
        type: u4        
      - id: ofs_un1
        type: u4
      - id: ofs_un2
        type: u4
      - id: ofs_un3
        type: u4 
      - id: ofs_un4
        type: u4
      - id: ofs_un5
        type: u4
      - id: ofs_un6
        type: u4  
      - id: ofs_un7
        type: u4         
  trashbox_section:
    seq:
      - id: trashbox
        type: trashbox
        repeat: expr
        repeat-expr: _root.tb_header.num_trashbox
    types:
      trashbox:
        seq:
          - id: node
            size: 35
            type: str
            encoding: ASCII         
          - id: trashbox_class
            size: 37
            type: str   
            encoding: ASCII         
          - id: unknown15
            size: 36
          - id: center_mass_in_b3d
            size: 12
            type: vector3f
          - id: unknown16
            size: 48 
          - id: inertia
            type: vector3f  
          - id: collision_center
            type: vector3f 
          - id: mass
            type: f4    
          - id: collision_radius
            type: f4   
          - id: rubber_collision_coeff
            type: f4   
          - id: corner_mark
            type: vector3f
            repeat: expr
            repeat-expr: 20
          - id: unknown17
            type: f4
            repeat: expr
            repeat-expr: 9
          - id: num_corner_mark
            type: u4
          - id: unknown18
            type: u4   
          - id: unknown19
            type: f4
            repeat: expr
            repeat-expr: 12  
          - id: col_plane
            type: vector4f
            repeat: expr
            repeat-expr: 20  
          - id: num_col_count
            type: u4
          - id: unknown20
            type: f4
            repeat: expr
            repeat-expr: 2
          - id: texture_bytes
            type: u4
          - id: circular_shadow
            type: u4        