CDF       
      scalar        ilev   !   lev        lat   �   lon   @   slat     slon  @         Conventions       CF-1.0     Description       ?Re-gridded CAM Initial Conditions from the following source(s):    source1       }/glade/p/umia0018/FC5AQUAP_sstQobs_1degFV_nconst_aeroOff/run/FC5AQUAP_sstQobs_1degFV_nconst_aeroOff.cam.i.0006-01-01-00000.nc      source_lev_info       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc      hybrid_sigma_pressure         !p(i,j,k) = A(k)*PO + B(k)*PS(i,j)      logname       tilmes     host      	cheyenne4      hosttype      x86_64-linux   Command       
NCL script     Date_Written      Thu Oct 20 17:49:57 MDT 2016   case      -f.e20.FSDC.f05_g16.atmo.chem01_cam5_4_152.001      q_adjust       True; Eliminate super-saturation   interp_log_ps         'True; Interpolate ln(Ps) rather than Ps    original_file_name        �     /glade/p/umia0018/FC5AQUAP_sstQobs_1degFV_nconst_aeroOff/run/FC5AQUAP_sstQobs_1degFV_nconst_aeroOff.cam.i.0006-01-01-00000.nc     original_file_desc        �     Jan 1 of Year 6 spin-up of a fixed-SST CAM5.3-FV aquaplanet run (with set_option = 3, corresponding to the QOBS SST profile)      original_file_res               L30, 1-deg resolution    original_file_aero        8     All aerosols other than sea-salt have been removed.   original_file_micro       g    MG1.5 microphys package is used, with constant ice crystal and cloud droplet number concentrations.    original_file_CO2               CCSM_CO2_PPMV = 348.     original_file_notes       �    For unknown reasons, we could not completely eliminate sulphur-based aerosols, but they are 7 orders of magnitude less than an Earth-like run      history      Mon Mar 23 10:25:40 2020: ncks -A fv_0.47x0.63_coord.nc /glade/p/cesmdata/cseg/inputdata/atm/cam/inic/cam_vcoords_L32_c180105.nc
Mon Mar 23 10:23:49 2020: ncks -v slat,lat,slon,lon f.e20.FSDC.f05_g16.atmo.chem01_cam5_4_152.001.cam.i.2016-03-01-00000.nc fv_0.47x0.63_coord.nc     NCO       "4.6.2"    source        CAM    title         UNSET      Version       $Name$     revision_Id       $Id$   initial_file      p/glade/p/acd/tilmes/inputdata/init/cesm2/f.e20.FSDC.f05_g16.atmo.chem01_cam5_4_152.001.cam.i.2016-12-01-00000.nc   topography_file       e/glade/p/acd/tilmes/inputdata/topo/fv_0.47x0.63_nc3000_Co030_Fi001_PF_nullRR_Nsw021_geos5_20171024.nc      time_period_freq      day_1      history_of_appended_files         �Mon Mar 23 10:25:40 2020: Appended file fv_0.47x0.63_coord.nc had following "history" attribute:
Mon Mar 23 10:23:49 2020: ncks -v slat,lat,slon,lon f.e20.FSDC.f05_g16.atmo.chem01_cam5_4_152.001.cam.i.2016-03-01-00000.nc fv_0.47x0.63_coord.nc
          P0                  	long_name         reference pressure     units         Pa          �   hyai               	long_name         (hybrid A coefficient at layer interfaces   source_file       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc          �   hyam               	long_name         'hybrid A coefficient at layer midpoints    source_file       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc           �   hybi               	long_name         (hybrid B coefficient at layer interfaces   source_file       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc          �   hybm               	long_name         'hybrid B coefficient at layer midpoints    source_file       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc           �   ilev               	long_name         'hybrid level at interfaces (1000*(A+B))    units         level      positive      down   standard_name         +atmosphere_hybrid_sigma_pressure_coordinate    formula_terms         a: hyai b: hybi p0: P0 ps: PS      source_file       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc          �   lev                	long_name         &hybrid level at midpoints (1000*(A+B))     units         level      positive      down   standard_name         +atmosphere_hybrid_sigma_pressure_coordinate    formula_terms         a: hyam b: hybm p0: P0 ps: PS      source_file       ]/glade/p/cesmdata/cseg/inputdata/atm/cam/inic/fv/cami-mam3_0000-01-01_0.9x1.25_L32_c141031.nc           �   lat                	long_name         latitude   units         degrees_north           �   lon                	long_name         	longitude      units         degrees_east        %�   slat               	long_name         staggered latitude     units         degrees_north        �  7�   slon               	long_name         staggered longitude    units         degrees_east        C�@�j     ?by��   ?t��   ?�Ͱ����?� *@   ?�r�L��s?��@   ?�d@   ?�ˎ    ?��`   ?���    ?�N`   ?���    ?����   ?�ɀ    ?�GL`   ?�Y:    ?�A%�   ?���@   ?�t    ?���    ?�&�    ?�8�    ?�I�    ?��y    ?��P�   ?�3x    ?�ӗ@   ?��O@   ?��Ġ   ?�x�`   ?pL�                   ?m���   ?��   ?�g�   ?�3�    ?�d�@   ?�}�   ?�uy    ?��`   ?��W�   ?�{s�   ?�r��   ?��P   ?�M��   ?ňf@   ?��C@   ?��0    ?Ĝf   ?�5԰   ?����   ?�?s�   ?���   ?��1�   ?�AP   ?��d�   ?�
dP   ?�C�   ?���@   ?���   ?��B    ?y��P   ?`L�                                                                                                                                   ?�&P�   ?��g�   ?��    ?�#C�   ?����   ?בΠ   ?�?@`   ?�v��   ?�x�   ?��`   ?�	�   ?�&�@   ?�23    ?�)�    ?�z�   ?��{`   ?�
    ?�                                                                                                                      ?�&P�   ?� H   ?��8�   ?�	dP   ?��bP   ?ԻG�   ?�臀   ?��(h   ?���   ?�Ҙ�   ?�Ҁ   ?�d�   ?묈�   ?���   ?횝P   ?�p{    ?�-°   ?��    @
�   @ s�   @$P�|?��@2�)B�  @=��&6�@C��  @G���  @LȬ   @P�;Y�  @T,�	@  @W�:	�  @[�]�@  @`l�5�  @cR�@  @f����  @j�}��  @ov���  @r��@  @u�݋�  @y�]   @~"f�  @��˝  @�b��  @�ӑ/�  @��瑐  @�j�O4  @�M�$  @�"��d  @��8  @��uk�  @�<Oa� @����   @�@     @%�W�  @af�  @,����  @8��s@  @A�-�  @E��̀  @IָI@  @N��  @Rp��  @U�	�  @Y�K̀  @^c�   @a��*`  @e3ڀ  @h��  @m��  @q���  @t#��   @w��M`  @{��`  @�eUt  @�:�X  @����  @��<`�  @����b  @��G3�  @��)xD  @��(:� @�A�Q�  @���C@ @���o0� @�r�   �V�     �Va���+�VC��C�W�V%���C��V�ʇ��U雽(���Uˇ�ʇ�U�s�lH0�U�_�	\�UqK��ʇ�US7zQ���U5#l�L��U_�	�T��R6�5�T��Dؐ`�T��7zQ��T��*��T������Tb�_��TD�V:�T&n��e�TZ�Dؐ�S�F�晼�S�2̈Z��S��*�S�
���>�Sq��m�j�SS�_��S5Ή� ��S�|R���R��n���Rےa�dC�R�~T8%n�R�jF���R�V9{���RcB,h��RE.�*�R'`�H�R	�s�Q����m��Q���F.��Q�������Q��Ή�!�Qr��+rL�QT���3x�Q6y�n���Qe����P�Q��v��P�=~T8&�P�)p��Q�P�c��|�P�V9{��Pc�H�<��PE�;|���P'�.�*�P	� ��V�O�:&ă�O�Y�O^��K���O"�֏
�N晻Ҍ^�N�q���NnI�Y��N2!k�b�M��P����M��6$�M}�g�g�MA� ���MX���L�0�2!k�L��u���LP���&�L�z��p�Kؐ`@*��K�hE���K`@*�/u�K$
���J���N4#�J��ڑ�y�Jo���8��J3w��'�I�O�\=~�I�'o����I~�T�B,�IB�:&ă�I�jF��Hʇ��1�H�^��K��HR6�4���H�xP5�G�晻Ҍ�G��~�T��Ga�dB�:�G%nI�Y��F�F.����F�^?�Fp��P���F4�ޔb��E�����C�E�}�g��E�U�^���ED-s�lH�EX���D��>)p��D��#l�M�DS��u��Dd�����C�<�7zQ�C��z���Cb읾~��C&ăV�B�hE���B�tM��BrL2̈[�B6$
��A���S��A���_�A���ڑ��AE���A	[�a�d�@�3w���@�\��@T�B,i�@�'o���?�&fD,�?@���H��>ȅ�tM��>P5x�R6�=��C�V��=_�	[��<�Dؐ`@�<n��d��;��m�i��;~T8%nH�;�r��:���3w��:c��|R�9�bA� �9$�,ȅ��8�r�O�\�84"�֏�7�Ҍ]���7C�V�d�6�2!k��6R�����5ڑ�y�p�5bA� ��4��K����4q��x�3�P���$�3� ����3�u��2�`@*�0�2
����1���8Ќ�1'o���8�0�jF���06�4�ޔ�/|���ƀ�.�]�����-��(��8�,�����+�|R����*�����P�)�;|����(� �'���`�'Z<(��&��6$�%&fD-p�$5x�R6��#Dؐ`@(�"T8%nI��!c��|R�� r�O�\8���0�0�#l�L���B,h��`�G�P��q���i��(���(��;������N0��N4"���2̈Z�@�pJܓ����0�2 � �G�W���Q��v� ��̈Z�D���
����^>� ?�^>� ?�
��?�̈Z�E ?�Q��v� @ �G�W�@��0�2 @pJܓ�@2̈Z�@@�N4"��@����N0@�(��;�@�i��(�@�q�@`�G�`@B,h�@#l�L��@��0�0@ r�O�\@@!c��|R�@"T8%nI�@#Dؐ`@0@$5x�R6�@%&fD-x@&��6$@'Z<(�@'���`@(�@)�;|���@*�����P@+�|R���@,����@-��(��@@.�]����@/|���ƈ@06�4�ޔ@0�jF��@1'o���8@1���8Ќ@2
���@2�`@*�0@3�u�@3� ���@3�P���(@4q��x@4��K���@5bA� �@5ڑ�y�p@6R����@6�2!k�@7C�V�h@7�Ҍ]��@84"�֏@8�r�O�\@9$�,ȅ�@9�bA� @:c��|T@:���3w�@;�r�@;~T8%nL@;��m�i�@<n��d�@<�Dؐ`@@=_�	[�@=��C�V�@>P5x�R8@>ȅ�tM�@?@���H�@?�&fD0@@�'o��@@T�B,j@@�\�@@�3w��@A	[�a�d@AE��@A���ڑ�@A���`@A���S�
@B6$
�@BrL2̈\@B�tM�@B�hE��@C&ăX@Cb읾 @C��z��@C�<�7zT@Dd����@DS��u�@D��#l�L@D��>)p�@EX��@ED-s�lH@E�U�^��@E�}�g�@E�����D@F4�ޔb�@Fp��P��@F�^@@F�F.���@G%nI�Y�@Ga�dB�<@G��~�T�@G�晻Ҍ@H�xP8@HR6�4��@H�^��K�@Hʇ��0@I�jF�@IB�:&Ą@I~�T�B,@I�'o���@I�O�\=�@J3w��(@Jo���8�@J��ڑ�|@J���N4$@K$
��@K`@*�/t@K�hE�� @Kؐ`@*�@L�z��p@LP���&@L��u��@L�0�2!l@MX��@MA� ��@M}�g�h@M��6$@M��P���@N2!k�d@NnI�Y�@N�q��@N晻Ҍ`@O"�֏
@O^��K��@O�X@O�:&ă@P	� ��V@P'�.�*@PE�;|� @Pc�H�<�@P�V9{�@P�c��|@P�)p��R@P�=~T8&@P�Q��v�@Qe���@Q6y�n��@QT���3x@Qr��+rL@Q��Ή�"@Q������@Q���F.�@Q����m�@R	�t@R'`�H@RE.�*@RcB,h�@R�V9{��@R�jF��@R�~T8%n@Rےa�dD@R��n��@S�|R��@S5Ή� �@SS�_�@Sq��m�j@S�
���>@S��*@S�2̈Z�@S�F�晼@TZ�Dؐ@T&n��f@TD�V:@Tb�_�@T�����@T��*�@T��7zQ�@T��Dؐ`@T��R6�6@U_�
@U5#l�L�@US7zQ��@UqK��ʈ@U�_�	\@U�s�lH0@Uˇ�ʇ@U雽(��@V�ʇ�@V%���C�@VC��C�X@Va���,@V�             ?�      ?�      ?�      @      @	      @      @�     @      @�     @      @�     @      @ @     @!�     @"�     @$      @%@     @&�     @'�     @)      @*@     @+�     @,�     @.      @/@     @0@     @0�     @1�     @2      @2�     @3`     @4      @4�     @5@     @5�     @6�     @7      @7�     @8`     @9      @9�     @:@     @:�     @;�     @<      @<�     @=`     @>      @>�     @?@     @?�     @@@     @@�     @@�     @A0     @A�     @A�     @B      @Bp     @B�     @C     @C`     @C�     @D      @DP     @D�     @D�     @E@     @E�     @E�     @F0     @F�     @F�     @G      @Gp     @G�     @H     @H`     @H�     @I      @IP     @I�     @I�     @J@     @J�     @J�     @K0     @K�     @K�     @L      @Lp     @L�     @M     @M`     @M�     @N      @NP     @N�     @N�     @O@     @O�     @O�     @P     @P@     @Ph     @P�     @P�     @P�     @Q     @Q0     @QX     @Q�     @Q�     @Q�     @Q�     @R      @RH     @Rp     @R�     @R�     @R�     @S     @S8     @S`     @S�     @S�     @S�     @T      @T(     @TP     @Tx     @T�     @T�     @T�     @U     @U@     @Uh     @U�     @U�     @U�     @V     @V0     @VX     @V�     @V�     @V�     @V�     @W      @WH     @Wp     @W�     @W�     @W�     @X     @X8     @X`     @X�     @X�     @X�     @Y      @Y(     @YP     @Yx     @Y�     @Y�     @Y�     @Z     @Z@     @Zh     @Z�     @Z�     @Z�     @[     @[0     @[X     @[�     @[�     @[�     @[�     @\      @\H     @\p     @\�     @\�     @\�     @]     @]8     @]`     @]�     @]�     @]�     @^      @^(     @^P     @^x     @^�     @^�     @^�     @_     @_@     @_h     @_�     @_�     @_�     @`     @`     @`,     @`@     @`T     @`h     @`|     @`�     @`�     @`�     @`�     @`�     @`�     @a     @a     @a0     @aD     @aX     @al     @a�     @a�     @a�     @a�     @a�     @a�     @a�     @b     @b      @b4     @bH     @b\     @bp     @b�     @b�     @b�     @b�     @b�     @b�     @b�     @c     @c$     @c8     @cL     @c`     @ct     @c�     @c�     @c�     @c�     @c�     @c�     @d      @d     @d(     @d<     @dP     @dd     @dx     @d�     @d�     @d�     @d�     @d�     @d�     @e     @e     @e,     @e@     @eT     @eh     @e|     @e�     @e�     @e�     @e�     @e�     @e�     @f     @f     @f0     @fD     @fX     @fl     @f�     @f�     @f�     @f�     @f�     @f�     @f�     @g     @g      @g4     @gH     @g\     @gp     @g�     @g�     @g�     @g�     @g�     @g�     @g�     @h     @h$     @h8     @hL     @h`     @ht     @h�     @h�     @h�     @h�     @h�     @h�     @i      @i     @i(     @i<     @iP     @id     @ix     @i�     @i�     @i�     @i�     @i�     @i�     @j     @j     @j,     @j@     @jT     @jh     @j|     @j�     @j�     @j�     @j�     @j�     @j�     @k     @k     @k0     @kD     @kX     @kl     @k�     @k�     @k�     @k�     @k�     @k�     @k�     @l     @l      @l4     @lH     @l\     @lp     @l�     @l�     @l�     @l�     @l�     @l�     @l�     @m     @m$     @m8     @mL     @m`     @mt     @m�     @m�     @m�     @m�     @m�     @m�     @n      @n     @n(     @n<     @nP     @nd     @nx     @n�     @n�     @n�     @n�     @n�     @n�     @o     @o     @o,     @o@     @oT     @oh     @o|     @o�     @o�     @o�     @o�     @o�     @o�     @p     @p     @p     @p"     @p,     @p6     @p@     @pJ     @pT     @p^     @ph     @pr     @p|     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @q     @q     @q     @q&     @q0     @q:     @qD     @qN     @qX     @qb     @ql     @qv     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @r     @r     @r     @r      @r*     @r4     @r>     @rH     @rR     @r\     @rf     @rp     @rz     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @s     @s     @s     @s$     @s.     @s8     @sB     @sL     @sV     @s`     @sj     @st     @s~     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @t      @t
     @t     @t     @t(     @t2     @t<     @tF     @tP     @tZ     @td     @tn     @tx     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @u     @u     @u     @u"     @u,     @u6     @u@     @uJ     @uT     @u^     @uh     @ur     @u|     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @v     @v     @v     @v&     @v0     @v:     @vD     @vN     @vX     @vb     @vl     @vv     �Vp��P���VR�����V4�ޔb��V��6$�U�����C�Uڑ�y�o�U�}�g��U�i��(��U�U�^���UbA� ��UD-s�lG�U&fD-s�UX���T��K����T��>)p��T��0�2!�T��#l�M�Tq��y�TS��u��T5x�R6��Td�����S�P���&�S�<�7zQ�S�(��;}�S��z���S� ����Sb읾~��SDؐ`@*�S&ăV�S�u��R�hE���R̈Z�D��R�tM��R�`@*�/�RrL2̈Z�RT8%nI��R6$
��R
����Q���S��Q����N4�Q���`�Q���8Ћ�Q���ڑ��Qc��|R��QE���Q'o���9�Q	[�a�e�P�G�W��P�3w���P�jF���P�\��Pr�O�\>�PT�B,i�P6�4�ޔ�P�'o���O�N4"���O�&fD.�O|���Ƅ�O@���H��O��0�1�Nȅ�tM��N�]�����NP5x�R7�N^>ԍ�M��C�V��M��(��;�M_�	[��M#l�L���L�Dؐ`@�L�����Ln��d��L2̈Z�D�K��m�i��K�|R����K~T8%nJ�KB,h��K�r��J�����N�J���3w��JQ��v���Jc��|S�I�;|����I�bA��I`�G�W�I$�,ȅ��H��H�r�O�\�HpJܓ��H4"�֏	�G���a�G�Ҍ]���G�q��GC�V�f�GZ<(��F�2!k��F�
�j�FR�����F��6$�Eڑ�y�o�E�i��(��EbA� ��E&fD-t�D��K����D��0�2!�Dq��y�D5x�R6��C�P���%�C�(��;|�C� ����CDؐ`@*�C�u��B̈Z�D��B�`@*�0�BT8%nI��B
����A����N4�A���8Њ�Ac��|R��A'o���8�@�G�W��@�jF���@r�O�\>�@6�4�ޔ�?�N4"���?|���Ƅ�?��0�1�>�]�����>^>Ԍ�=��(��;�=#l�L���<�����<2̈Z�F�;�|R����;B,h��:�����M�:Q��v���9�;|����9`�G�V�8��8pJܓ��7���a�7�q��7Z<(��6�
�j�6��6$�5�i��(��5&fD-s�4��0�2 �45x�R6��3�(��;|�3Dؐ`@*�2̈Z�D��2T8%nI��1����N4�1c��|R��0�G�W��0r�O�\<�/�N4"���/��0�0�.^>Ԍ�-#l�L���,2̈Z�F�+B,h��*Q��v���)`�G�U�(pJܓ��'�q��&�
�h�%�i��(��$��0�2 �#�(��;|�"̈Z�D��!����N4� �G�W���N4"���^>Ԉ�2̈Z�?�Q��v���pJܓ���
�h���0�2 �̈Z�D���G�W��^>ԁ�
Q��v����
�`�̈Z�Dп�^>ԁ���
�`��^>ԁ��^>ԁ        ?�^>ԁ?�^>��?��
��?�^>Ԡ@̈Z�D�@�
�o@
Q��v� @^>ԑ@�G�W�@̈Z�D�@��0�2(@�
�o@pJܓ�@Q��v� @2̈Z�H@^>ԏ@�N4"��@ �G�W�@!����N4@"̈Z�D�@#�(��;�@$��0�2$@%�i��(�@&�
�l@'�q�@(pJܓ�@)`�G�Y@*Q��v��@+B,h�@,2̈Z�H@-#l�L��@.^>ԏ@/��0�4@/�N4"��@0r�O�\>@0�G�W�@1c��|R�@1����N6@2T8%nI�@2̈Z�D�@3Dؐ`@,@3�(��;~@45x�R6�@4��0�2#@5&fD-t@5�i��(�@6��6$@6�
�m@7Z<(�@7�q�@7���b@8pJܓ�@8�@9`�G�W@9�;|���@:Q��v��@:�����P@;B,h�@;�|R���@<2̈Z�F@<����@=#l�L��@=��(��;@>^>ԏ@>�]����@?��0�5@?|���ƈ@?�N4"��@@6�4�ޔ@@r�O�\>@@�jF��@@�G�W�@A'o���9@Ac��|R�@A���8Ќ@A����N5@B
���@BT8%nI�@B�`@*�0@B̈Z�D�@C�u�@CDؐ`@,@C� ���@C�(��;~@C�P���(@D5x�R6�@Dq��y@D��0�2#@D��K���@E&fD-t@EbA� �@E�i��(�@Eڑ�y�p@F��6$@FR����@F�
�m@F�2!k�@GZ<(�@GC�V�g@G�q�@G�Ҍ]��@G���b@H4"�֏@HpJܓ�@H�r�O�]@H�@I$�,ȅ�@I`�G�Y@I�bA� @I�;|���@Jc��|T@JQ��v��@J���3w�@J�����O@K�r�@KB,h�@K~T8%nI@K�|R���@K��m�i�@L2̈Z�G@Ln��d�@L����@L�Dؐ`A@M#l�L��@M_�	[�@M��(��;@M��C�V�@N^>ԏ@NP5x�R9@N�]����@Nȅ�tM�@O��0�4@O@���H�@O|���Ƅ@O�&fD.@O�N4"��@P�'o��@P6�4�ޔ@PT�B,k@Pr�O�\>@P�\�@P�jF��@P�3w��@P�G�W�@Q	[�a�e@Q'o���:@QE��@Qc��|R�@Q���ڑ�@Q���8Ќ@Q���`@Q����N4@Q���S�	@R
���@R6$
�@RT8%nI�@RrL2̈]@R�`@*�0@R�tM�@R̈Z�D�@R�hE��@S�u�@S&ăV@SDؐ`@+@Sb읾 @S� ���@S��z��@S�(��;~@S�<�7zR@S�P���&@Td����@T5x�R6�@TS��u�@Tq��y@T��#l�N@T��0�2#@T��>)p�@T��K���@UX��@U&fD-t@UD-s�lG@UbA� �@U�U�^��@U�i��(�@U�}�g�@Uڑ�y�p@U�����E@V��6$@V4�ޔb�@VR����@Vp��P����      ?�      ?�      ?�      @�     @�     @�     @@     @�     @@     @�     @@     @�     @@     @ �     @"      @#`     @$�     @%�     @'      @(`     @)�     @*�     @,      @-`     @.�     @/�     @0�     @10     @1�     @2p     @3     @3�     @4P     @4�     @5�     @60     @6�     @7p     @8     @8�     @9P     @9�     @:�     @;0     @;�     @<p     @=     @=�     @>P     @>�     @?�     @@     @@h     @@�     @A     @AX     @A�     @A�     @BH     @B�     @B�     @C8     @C�     @C�     @D(     @Dx     @D�     @E     @Eh     @E�     @F     @FX     @F�     @F�     @GH     @G�     @G�     @H8     @H�     @H�     @I(     @Ix     @I�     @J     @Jh     @J�     @K     @KX     @K�     @K�     @LH     @L�     @L�     @M8     @M�     @M�     @N(     @Nx     @N�     @O     @Oh     @O�     @P     @P,     @PT     @P|     @P�     @P�     @P�     @Q     @QD     @Ql     @Q�     @Q�     @Q�     @R     @R4     @R\     @R�     @R�     @R�     @R�     @S$     @SL     @St     @S�     @S�     @S�     @T     @T<     @Td     @T�     @T�     @T�     @U     @U,     @UT     @U|     @U�     @U�     @U�     @V     @VD     @Vl     @V�     @V�     @V�     @W     @W4     @W\     @W�     @W�     @W�     @W�     @X$     @XL     @Xt     @X�     @X�     @X�     @Y     @Y<     @Yd     @Y�     @Y�     @Y�     @Z     @Z,     @ZT     @Z|     @Z�     @Z�     @Z�     @[     @[D     @[l     @[�     @[�     @[�     @\     @\4     @\\     @\�     @\�     @\�     @\�     @]$     @]L     @]t     @]�     @]�     @]�     @^     @^<     @^d     @^�     @^�     @^�     @_     @_,     @_T     @_|     @_�     @_�     @_�     @`     @`"     @`6     @`J     @`^     @`r     @`�     @`�     @`�     @`�     @`�     @`�     @`�     @a     @a&     @a:     @aN     @ab     @av     @a�     @a�     @a�     @a�     @a�     @a�     @b     @b     @b*     @b>     @bR     @bf     @bz     @b�     @b�     @b�     @b�     @b�     @b�     @c     @c     @c.     @cB     @cV     @cj     @c~     @c�     @c�     @c�     @c�     @c�     @c�     @d
     @d     @d2     @dF     @dZ     @dn     @d�     @d�     @d�     @d�     @d�     @d�     @d�     @e     @e"     @e6     @eJ     @e^     @er     @e�     @e�     @e�     @e�     @e�     @e�     @e�     @f     @f&     @f:     @fN     @fb     @fv     @f�     @f�     @f�     @f�     @f�     @f�     @g     @g     @g*     @g>     @gR     @gf     @gz     @g�     @g�     @g�     @g�     @g�     @g�     @h     @h     @h.     @hB     @hV     @hj     @h~     @h�     @h�     @h�     @h�     @h�     @h�     @i
     @i     @i2     @iF     @iZ     @in     @i�     @i�     @i�     @i�     @i�     @i�     @i�     @j     @j"     @j6     @jJ     @j^     @jr     @j�     @j�     @j�     @j�     @j�     @j�     @j�     @k     @k&     @k:     @kN     @kb     @kv     @k�     @k�     @k�     @k�     @k�     @k�     @l     @l     @l*     @l>     @lR     @lf     @lz     @l�     @l�     @l�     @l�     @l�     @l�     @m     @m     @m.     @mB     @mV     @mj     @m~     @m�     @m�     @m�     @m�     @m�     @m�     @n
     @n     @n2     @nF     @nZ     @nn     @n�     @n�     @n�     @n�     @n�     @n�     @n�     @o     @o"     @o6     @oJ     @o^     @or     @o�     @o�     @o�     @o�     @o�     @o�     @o�     @p	     @p     @p     @p'     @p1     @p;     @pE     @pO     @pY     @pc     @pm     @pw     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @p�     @q     @q     @q     @q!     @q+     @q5     @q?     @qI     @qS     @q]     @qg     @qq     @q{     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @q�     @r     @r     @r     @r%     @r/     @r9     @rC     @rM     @rW     @ra     @rk     @ru     @r     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @r�     @s     @s     @s     @s     @s)     @s3     @s=     @sG     @sQ     @s[     @se     @so     @sy     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @s�     @t     @t     @t     @t#     @t-     @t7     @tA     @tK     @tU     @t_     @ti     @ts     @t}     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @t�     @u	     @u     @u     @u'     @u1     @u;     @uE     @uO     @uY     @uc     @um     @uw     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @u�     @v     @v     @v     @v!     @v+     @v5     @v?     @vI     @vS     @v]     @vg     @vq     