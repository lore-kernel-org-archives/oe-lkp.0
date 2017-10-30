Content-Type: multipart/mixed; boundary="===============6736268519732180018=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf/x86] a5df70c354: perf-sanity-tests.Parse_event_definition_strings.fail
Date: Mon, 30 Oct 2017 13:02:16 +0800
Message-ID: <1dd03483-a791-2099-ee00-8d08f8cfd354@intel.com>
In-Reply-To: <20171027204406.GC22894@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6736268519732180018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

attached to full output:


root(a)lkp-hsw-ep5 /usr/src/linux-perf-x86_64-rhel-7.2-bb176f67090ca54869fc=
1262c913aa69d2ede070/tools/perf# ./perf test -F 6 -v
  6: Parse event definition strings                        :
--- start ---
running test 0 'syscalls:sys_enter_openat'
Using CPUID GenuineIntel-6-3F
running test 1 'syscalls:*'
running test 2 'r1a'
running test 3 '1:1'
running test 4 'instructions'
running test 5 'cycles/period=3D100000,config2/'
running test 6 'faults'
running test 7 'L1-dcache-load-miss'
running test 8 'mem:0'
running test 9 'mem:0:x'
running test 10 'mem:0:r'
running test 11 'mem:0:w'
running test 12 'syscalls:sys_enter_openat:k'
running test 13 'syscalls:*:u'
running test 14 'r1a:kp'
running test 15 '1:1:hp'
running test 16 'instructions:h'
running test 17 'faults:u'
running test 18 'L1-dcache-load-miss:kp'
running test 19 'mem:0:u'
running test 20 'mem:0:x:k'
running test 21 'mem:0:r:hp'
running test 22 'mem:0:w:up'
running test 23 'r1,syscalls:sys_enter_openat:k,1:1:hp'
running test 24 'instructions:G'
running test 25 'instructions:H'
running test 26 'mem:0:rw'
running test 27 'mem:0:rw:kp'
running test 28 '{instructions:k,cycles:upp}'
running test 29 '{faults:k,cache-references}:u,cycles:k'
running test 30 'group1{syscalls:sys_enter_openat:H,cycles:kppp},group2{cyc=
les,1:3}:G,instructions:u'
running test 31 '{cycles:u,instructions:kp}:p'
running test 32 '{cycles,instructions}:G,{cycles:G,instructions:G},cycles'
running test 33 '*:*'
   [kvmmmu:kvm_mmu_get_page] bad op token {
   [kvmmmu:kvm_mmu_sync_page] bad op token {
   [kvmmmu:kvm_mmu_unsync_page] bad op token {
   [kvmmmu:kvm_mmu_prepare_zap_page] bad op token {
   [kvmmmu:fast_page_fault] function is_writable_pte not defined
   [libata:ata_qc_issue] function libata_trace_parse_subcmd not defined
   [libata:ata_qc_complete_internal] function libata_trace_parse_qc_flags n=
ot defined
   [libata:ata_qc_complete_failed] function libata_trace_parse_qc_flags not=
 defined
   [libata:ata_qc_complete_done] function libata_trace_parse_qc_flags not d=
efined
   [libata:ata_eh_link_autopsy] function libata_trace_parse_eh_action not d=
efined
   [libata:ata_eh_link_autopsy_qc] function libata_trace_parse_qc_flags not=
 defined
   [sunrpc:xprt_lookup_rqst] function __builtin_bswap32 not defined
   [sunrpc:xprt_transmit] function __builtin_bswap32 not defined
   [sunrpc:xprt_complete_rqst] function __builtin_bswap32 not defined
   [sunrpc:xs_tcp_data_recv] function __builtin_bswap32 not defined
   [sunrpc:svc_recv] function __builtin_bswap32 not defined
   [sunrpc:svc_defer] function __builtin_bswap32 not defined
   [sunrpc:svc_drop] function __builtin_bswap32 not defined
   [sunrpc:svc_process] function __builtin_bswap32 not defined
   [sunrpc:svc_send] function __builtin_bswap32 not defined
   [sunrpc:svc_drop_deferred] function __builtin_bswap32 not defined
   [sunrpc:svc_revisit_deferred] function __builtin_bswap32 not defined
   [ras:extlog_mem_event] function cper_severity_str not defined
   [ras:mc_event] function mc_event_error_type not defined
   [xhci-hcd:xhci_handle_event] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_handle_command] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_handle_transfer] function xhci_ring_type_string not defin=
ed
   [xhci-hcd:xhci_queue_trb] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_urb_enqueue] bad op token {
   [xhci-hcd:xhci_urb_giveback] bad op token {
   [xhci-hcd:xhci_urb_dequeue] bad op token {
   [xhci-hcd:xhci_handle_cmd_stop_ep] function xhci_decode_ep_context not d=
efined
   [xhci-hcd:xhci_handle_cmd_set_deq_ep] function xhci_decode_ep_context no=
t defined
   [xhci-hcd:xhci_handle_cmd_reset_ep] function xhci_decode_ep_context not =
defined
   [xhci-hcd:xhci_handle_cmd_config_ep] function xhci_decode_ep_context not=
 defined
   [xhci-hcd:xhci_alloc_dev] function xhci_decode_slot_context not defined
   [xhci-hcd:xhci_free_dev] function xhci_decode_slot_context not defined
   [xhci-hcd:xhci_handle_cmd_disable_slot] function xhci_decode_slot_contex=
t not defined
   [xhci-hcd:xhci_discover_or_reset_device] function xhci_decode_slot_conte=
xt not defined
   [xhci-hcd:xhci_setup_device_slot] function xhci_decode_slot_context not =
defined
   [xhci-hcd:xhci_handle_cmd_addr_dev] function xhci_decode_slot_context no=
t defined
   [xhci-hcd:xhci_handle_cmd_reset_dev] function xhci_decode_slot_context n=
ot defined
   [xhci-hcd:xhci_handle_cmd_set_deq] function xhci_decode_slot_context not=
 defined
   [xhci-hcd:xhci_ring_alloc] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_ring_free] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_ring_expansion] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_inc_enq] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_inc_deq] function xhci_ring_type_string not defined
   [xhci-hcd:xhci_handle_port_status] function xhci_decode_portsc not defin=
ed
   [dwc3:dwc3_event] function dwc3_decode_event not defined
   [dwc3:dwc3_ctrl_req] function dwc3_decode_ctrl not defined
   [dwc3:dwc3_gadget_generic_cmd] function dwc3_gadget_generic_cmd_string n=
ot defined
   [dwc3:dwc3_gadget_ep_cmd] function dwc3_gadget_ep_cmd_string not defined
   [dwc3:dwc3_prepare_trb] bad op token {
   [dwc3:dwc3_complete_trb] bad op token {
   [scsi:scsi_dispatch_cmd_start] function scsi_trace_parse_cdb not defined
   [scsi:scsi_dispatch_cmd_error] function scsi_trace_parse_cdb not defined
   [scsi:scsi_dispatch_cmd_done] function scsi_trace_parse_cdb not defined
   [scsi:scsi_dispatch_cmd_timeout] function scsi_trace_parse_cdb not defin=
ed
   [jbd2:jbd2_run_stats] function jiffies_to_msecs not defined
   [jbd2:jbd2_checkpoint_stats] function jiffies_to_msecs not defined
   [fs_dax:dax_pmd_insert_mapping] unknown op '~'
   [fs_dax:dax_pmd_insert_mapping_fallback] unknown op '~'
   [xen:xen_mc_entry] function xen_hypercall_name not defined
   [xen:xen_mc_extend_args] function xen_hypercall_name not defined
   [xen:xen_mmu_set_pte] function pte_val not defined
   [xen:xen_mmu_set_pte_atomic] function pte_val not defined
   [xen:xen_mmu_set_pte_at] function pte_val not defined
   [xen:xen_mmu_set_pmd] function pmd_val not defined
   [xen:xen_mmu_set_pud] function pud_val not defined
   [xen:xen_mmu_set_p4d] function sizeof not defined
   [xen:xen_mmu_ptep_modify_prot_start] function pte_val not defined
   [xen:xen_mmu_ptep_modify_prot_commit] function pte_val not defined
running test 34 '{cycles,cache-misses:G}:H'
running test 35 '{cycles,cache-misses:H}:G'
running test 36 '{cycles:G,cache-misses:H}:u'
running test 37 '{cycles:G,cache-misses:H}:uG'
running test 38 '{cycles,cache-misses,branch-misses}:S'
running test 39 '{instructions,branch-misses}:Su'
running test 40 'instructions:uDp'
running test 41 '{cycles,cache-misses,branch-misses}:D'
running test 42 'mem:0/1'
running test 43 'mem:0/2:w'
running test 44 'mem:0/4:rw:u'
running test 45 'instructions:I'
running test 46 'instructions:kIG'
running test 47 'task-clock:P,cycles'
running test 48 'instructions/name=3Dinsn/'
running test 49 'r1234/name=3Drawpmu/'
running test 50 '4:0x6530160/name=3Dnumpmu/'
running test 51 'L1-dcache-misses/name=3Dcachepmu/'
running test 0 'cpu/config=3D10,config1,config2=3D3,period=3D1000/u'
running test 1 'cpu/config=3D1,name=3Dkrava/u,cpu/config=3D2/u'
running test 2 'cpu/config=3D1,call-graph=3Dfp,time,period=3D100000/,cpu/co=
nfig=3D2,call-graph=3Dno,time=3D0,period=3D2000/'
topdown-recovery-bubbles -> cpu/event=3D0xd,umask=3D0x3,cmask=3D1,any=3D1/
topdown-slots-issued -> cpu/event=3D0xe,umask=3D0x1/
topdown-fetch-bubbles -> cpu/event=3D0x9c,umask=3D0x1/
mem-loads -> cpu/event=3D0xcd,umask=3D0x1,ldlat=3D3/
el-commit -> cpu/event=3D0xc8,umask=3D0x2/
el-capacity -> cpu/event=3D0x54,umask=3D0x2/
topdown-total-slots -> cpu/event=3D0x3c,umask=3D0x0,any=3D1/
el-conflict -> cpu/event=3D0x54,umask=3D0x1/
mem-stores -> cpu/event=3D0xd0,umask=3D0x82/
tx-start -> cpu/event=3D0xc9,umask=3D0x1/
tx-capacity -> cpu/event=3D0x54,umask=3D0x2/
el-abort -> cpu/event=3D0xc8,umask=3D0x4/
tx-conflict -> cpu/event=3D0x54,umask=3D0x1/
tx-commit -> cpu/event=3D0xc9,umask=3D0x2/
tx-abort -> cpu/event=3D0xc9,umask=3D0x4/
el-start -> cpu/event=3D0xc8,umask=3D0x1/
Invalid event/parameter 'in_tx'
Invalid event/parameter 'in_tx'
failed to parse event 'cpu/event=3Dcycles-t/u', err 1
---- end ----
Parse event definition strings: FAILED!

-----------------------------------

cpuinfo:
root(a)lkp-hsw-ep5 /usr/src/linux-perf-x86_64-rhel-7.2-bb176f67090ca54869fc=
1262c913aa69d2ede070/tools/perf# lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                56
On-line CPU(s) list:   0-55
Thread(s) per core:    2
Core(s) per socket:    14
Socket(s):             2
NUMA node(s):          2
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 63
Model name:            Intel(R) Xeon(R) CPU E5-2695 v3 @ 2.30GHz
Stepping:              2
CPU MHz:               2299.871
CPU max MHz:           3300.0000
CPU min MHz:           1200.0000
BogoMIPS:              4599.74
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              35840K
NUMA node0 CPU(s):     0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,=
38,40,42,44,46,48,50,52,54
NUMA node1 CPU(s):     1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,=
39,41,43,45,47,49,51,53,55
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge=
 mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall=
 nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtop=
ology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx =
smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic mov=
be popcnt aes xsave avx f16c rdrand lahf_lm abm cpuid_fault epb tpr_shadow =
vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms inv=
pcid cqm xsaveopt cqm_llc cqm_occup_llc dtherm ida arat pln pts
-----------------------------------


Thanks
Zhijian


On 10/28/2017 4:44 AM, Andi Kleen wrote:
> On Fri, Oct 27, 2017 at 04:11:09PM +0800, Li Zhijian wrote:
>> + members of perf test
>>
>> ping
>>
>> add more results on different platforms
>> haswell: FAIL(OK at v4.13)
> Don't have a system, but can you please post the output of
>
> perf test -F 6 -v
>
> on the Haswell?
>
> -Andi


--===============6736268519732180018==--

