Content-Type: multipart/mixed; boundary="===============7855579162524387034=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [drm/radeon] 38c2adfb00d: Fixed kernel panic
Date: Mon, 12 Jan 2015 10:33:08 +0800
Message-ID: <1421029988.6201.150.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7855579162524387034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 38c2adfb00db045a876dd667040abc01b788ad61 ("drm/radeon: Init amdkfd o=
nly if it was compiled")

The original kernel panic caused by radeon init is fixed!  Thanks!

testbox/testcase/testparams: vm-vp-quantal-i386/boot/1

68d0cb49f8db5ddc  38c2adfb00db045a876dd66704  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :10         100%          10:10    kmsg.dummy-irq:no_IRQ_given.U=
se_irq=3DN
           :10         100%          10:10    kmsg.mk712:device_not_present
           :10         100%          10:10    kmsg.wistron_btns:System_unkn=
own
           :10         100%          10:10    kmsg.ideapad_slidebar:DMI_doe=
s_not_match
           :10         100%          10:10    kmsg.i2c-parport-light:adapte=
r_type_unspecified
           :10         100%          10:10    kmsg.i2c_i2c-#:detect_fail:ad=
dress_match
           :10         100%          10:10    kmsg.pc87360:PC8736x_not_dete=
cted,module_not_inserted
           :10         100%          10:10    kmsg.sch56xx_common:Unsupport=
ed_device_id
           :10         100%          10:10    kmsg.acquirewdt:I/O_address#a=
lready_in_use
           :10         100%          10:10    kmsg.wafer5823wdt:I/O_address=
#already_in_use
           :10         100%          10:10    kmsg.i6300esb:cannot_register=
_miscdev_on_minor=3D#(err=3D-#)
           :10         100%          10:10    kmsg.pc87413_wdt:cannot_regis=
ter_miscdev_on_minor=3D#(err=3D-#)
           :10         100%          10:10    kmsg.sbc60xxwdt:I/O_address#a=
lready_in_use
           :10         100%          10:10    kmsg.sbc8360:failed_to_regist=
er_misc_device
           :10         100%          10:10    kmsg.sbc7240_wdt:I/O_address#=
already_in_use
           :10         100%          10:10    kmsg.cpu5wdt:misc_register_fa=
iled
           :10         100%          10:10    kmsg.w83877f_wdt:I/O_address#=
already_in_use
           :10         100%          10:10    kmsg.sbc_epx_c3:cannot_regist=
er_miscdev_on_minor=3D#(err=3D-#)
           :10         100%          10:10    kmsg.Driver'mmcblk'needs_upda=
ting-please_use_bus_type_methods
           :10         100%          10:10    kmsg.vme_user:No_cards,skippi=
ng_registration
           :10         100%          10:10    kmsg.dell_wmi:No_known_WMI_GU=
ID_found
           :10         100%          10:10    kmsg.dell_wmi_aio:No_known_WM=
I_GUID_found
           :10         100%          10:10    kmsg.acer_wmi:No_or_unsupport=
ed_WMI_interface,unable_to_load
           :10         100%          10:10    kmsg.acerhdf:error_getting_ha=
rdware_information
           :10         100%          10:10    kmsg.alienware_wmi:alienware-=
wmi:No_known_WMI_GUID_found
           :10         100%          10:10    kmsg.fmc_fake-design-for-test=
ing-f001:Driver_has_no_ID:matches_all
           :10         100%          10:10    kmsg.fmc_write_eeprom_fake-de=
sign-for-testing-f001:fmc_write_eeprom:no_busid_passed,refusing_all_cards
           :10         100%          10:10    kmsg.intel_rapl:no_valid_rapl=
_domains_found_in_package
         10:10        -100%            :10    kmsg.BUG:unable_to_handle_ker=
nel
         10:10        -100%            :10    kmsg.Oops
         10:10        -100%            :10    kmsg.Kernel_panic-not_syncing=
:Fatal_exception
         10:10        -100%            :10    kmsg.Kernel_Offset:#from#(rel=
ocation_range:#-#)
         10:10        -100%            :10    dmesg.BUG:unable_to_handle_ke=
rnel
         10:10        -100%            :10    dmesg.Oops
         10:10        -100%            :10    dmesg.Kernel_panic-not_syncin=
g:Fatal_exception

testbox/testcase/testparams: vm-kbuild-yocto-i386/boot/1

68d0cb49f8db5ddc  38c2adfb00db045a876dd66704  =

----------------  --------------------------  =

           :10         100%          10:10    kmsg.dummy-irq:no_IRQ_given.U=
se_irq=3DN
           :10         100%          10:10    kmsg.dummy-irq:no_IRQ_given.U=
se_irq=3DN
           :10         100%          10:10    kmsg.wistron_btns:System_unkn=
own
           :10         100%          10:10    kmsg.i2c-parport-light:adapte=
r_type_unspecified
           :10         100%          10:10    kmsg.i2c-parport-light:adapte=
r_type_unspecified
           :10         100%          10:10    kmsg.pc87360:PC8736x_not_dete=
cted,module_not_inserted
           :10         100%          10:10    kmsg.sch56xx_common:Unsupport=
ed_device_id
           :10         100%          10:10    kmsg.i6300esb:cannot_register=
_miscdev_on_minor=3D#(err=3D-#)
           :10         100%          10:10    kmsg.pc87413_wdt:cannot_regis=
ter_miscdev_on_minor=3D#(err=3D-#)
           :10         100%          10:10    kmsg.sbc60xxwdt:I/O_address#a=
lready_in_use
           :10         100%          10:10    kmsg.sbc8360:failed_to_regist=
er_misc_device
           :10         100%          10:10    kmsg.sbc7240_wdt:I/O_address#=
already_in_use
           :10         100%          10:10    kmsg.cpu5wdt:misc_register_fa=
iled
           :10         100%          10:10    kmsg.w83877f_wdt:I/O_address#=
already_in_use
           :10         100%          10:10    kmsg.sbc_epx_c3:cannot_regist=
er_miscdev_on_minor=3D#(err=3D-#)
           :10         100%          10:10    kmsg.dell_wmi:No_known_WMI_GU=
ID_found
           :10         100%          10:10    kmsg.dell_wmi_aio:No_known_WM=
I_GUID_found
           :10         100%          10:10    kmsg.acer_wmi:No_or_unsupport=
ed_WMI_interface,unable_to_load
           :10         100%          10:10    kmsg.acerhdf:error_getting_ha=
rdware_information
           :10         100%          10:10    kmsg.alienware_wmi:alienware-=
wmi:No_known_WMI_GUID_found
           :10         100%          10:10    kmsg.alienware_wmi:alienware-=
wmi:No_known_WMI_GUID_found
           :10         100%          10:10    kmsg.fmc_fake-design-for-test=
ing-f001:Driver_has_no_ID:matches_all
           :10         100%          10:10    kmsg.fmc_fake-design-for-test=
ing-f001:Driver_has_no_ID:matches_all
           :10         100%          10:10    kmsg.fmc_write_eeprom_fake-de=
sign-for-testing-f001:fmc_write_eeprom:no_busid_passed,refusing_all_cards
           :10         100%          10:10    kmsg.fmc_write_eeprom_fake-de=
sign-for-testing-f001:fmc_write_eeprom:no_busid_passed,refusing_all_cards
         10:10        -100%            :10    kmsg.BUG:unable_to_handle_ker=
nel
         10:10        -100%            :10    kmsg.BUG:unable_to_handle_ker=
nel
         10:10        -100%            :10    kmsg.Oops
         10:10        -100%            :10    kmsg.Oops
         10:10        -100%            :10    kmsg.Kernel_panic-not_syncing=
:Fatal_exception
         10:10        -100%            :10    kmsg.Kernel_panic-not_syncing=
:Fatal_exception
         10:10        -100%            :10    kmsg.Kernel_Offset:#from#(rel=
ocation_range:#-#)
         10:10        -100%            :10    kmsg.Kernel_Offset:#from#(rel=
ocation_range:#-#)
         10:10        -100%            :10    dmesg.BUG:unable_to_handle_ke=
rnel
         10:10        -100%            :10    dmesg.BUG:unable_to_handle_ke=
rnel
         10:10        -100%            :10    dmesg.Oops
         10:10        -100%            :10    dmesg.Oops
         10:10        -100%            :10    dmesg.Kernel_panic-not_syncin=
g:Fatal_exception
         10:10        -100%            :10    dmesg.Kernel_panic-not_syncin=
g:Fatal_exception
           :10         100%          10:10    kmsg.drm/i810_does_not_suppor=
t_SMP
           :10         100%          10:10    kmsg.nandsim]warning:read_byt=
e:unexpected_data_output_cycle,state_is_STATE_READY_return
           :10         100%          10:10    kmsg.nandsim]warning:read_byt=
e:unexpected_data_output_cycle,state_is_STATE_READY_return
           :10         100%          10:10    kmsg.ks0108:ERROR:parport_did=
n't_register_new_device
           :10         100%          10:10    kmsg.cfag12864b:ERROR:ks0108_=
is_not_initialized
           :10         100%          10:10    kmsg.cfag12864bfb:ERROR:cfag1=
2864b_is_not_initialized
           :10         100%          10:10    kmsg.pps_parport:couldn't_reg=
ister_with_parport0
           :10         100%          10:10    kmsg.applesmc:supported_lapto=
p_not_found
           :10         100%          10:10    kmsg.applesmc:driver_init_fai=
led(ret=3D-#)
           :10         100%          10:10    kmsg.vmap_allocation_for_size=
#failed:use_vmalloc=3D<size>to_increase_size
           :10         100%          10:10    kmsg.null):enodev_DEV_ADDR=3D=
#xFF
           :10         100%          10:10    kmsg.toshiba_acpi:Unable_to_c=
reate_proc_dir_toshiba
           :10         100%          10:10    kmsg.mce:Unable_to_init_devic=
e/dev/mcelog(rc:-#)
           :10         100%          10:10    kmsg.mce:Unable_to_init_devic=
e/dev/mcelog(rc:-#)
           :10         100%          10:10    kmsg.Starting_Bootlog_daemon:=
bootlogd:cannot_allocate_pseudo_tty:No_such_file_or_directory
           :10         100%          10:10    kmsg.no_ifx_modem_active
           :10          10%           1:10    kmsg.APIC_calibration_not_con=
sistent_with_PM-Timer:#ms_instead_of#ms
           :10         100%          10:10    kmsg.Failed_to_add_WC_MTRR_fo=
r[#-#];performance_may_suffer
           :10         100%          10:10    kmsg.mtdoops:mtd_device(mtdde=
v=3Dname/number)must_be_supplied
           :10         100%          10:10    kmsg.Warning!fusbh200_hcd_sho=
uld_always_be_loaded_before_uhci_hcd_and_ohci_hcd,not_after
           :10         100%          10:10    kmsg.rtc(null):invalid_alarm_=
value
           :10         100%          10:10    kmsg.intel_powerclamp:Intel_p=
owerclamp_does_not_run_on_family#model
           :10         100%          10:10    kmsg.geodewdt:No_timers_were_=
available
           :10         100%          10:10    kmsg.sc1200wdt:io_parameter_m=
ust_be_specified
           :10         100%          10:10    kmsg.acerhdf:unknown(unsuppor=
ted)BIOS_version_Bochs/Bochs/Bochs,please_report,aborting
           :10         100%          10:10    kmsg.msi_wmi:This_machine_doe=
sn't_have_neither_MSI-hotkeys_nor_backlight_through_WMI
           :10         100%          10:10    kmsg.ALSA:seq_oss:can't_regis=
ter_device_seq
           :10         100%          10:10    kmsg.rcu-torture:Free-Block_C=
irculation

vm-vp-quantal-i386: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap
Memory: 360M

vm-kbuild-yocto-i386: qemu-system-i386 -enable-kvm
Memory: 320M


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============7855579162524387034==--

